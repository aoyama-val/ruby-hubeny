require "hubeny/version"

module Hubeny
  DEG2RAD = Math::PI / 180.0
  RAD2DEG = 180.0 / Math::PI

  # ベッセル楕円体（ 旧日本測地系）
  BESSEL_R_X  = 6377397.155000 # 赤道半径
  BESSEL_R_Y  = 6356079.000000 # 極半径

  # GRS80（世界測地系）
  GRS80_R_X   = 6378137.000000 # 赤道半径
  GRS80_R_Y   = 6356752.314140 # 極半径

  # WGS84（GPS）
  WGS84_R_X   = 6378137.000000 # 赤道半径
  WGS84_R_Y   = 6356752.314245 # 極半径

  @gcs = 2  # 測地系

  def self.distance(lat1, lng1, lat2, lng2, algorithm: :hubeny)
    case algorithm
    when :hubeny
      return self.hubeny(lat1, lng1, lat2, lng2)
    when :haversine
      return self.haversine(lat1, lng1, lat2, lng2)
    else
      raise "Algorithm '#{algorithm}' is not implemented."
    end
  end

  def self.haversine(lat1, lng1, lat2, lng2)
    lat1 *= DEG2RAD
    lat2 *= DEG2RAD
    lng1 *= DEG2RAD
    lng2 *= DEG2RAD
    d1  = Math::sin(lat1) * Math::sin(lat2)
    d2  = Math::cos(lat1) * Math::cos(lat2) * Math::cos(lng2 - lng1)
    d0  = r_x * Math::acos(d1 + d2)
    return d0
  end

  def self.hubeny(lat1, lng1, lat2, lng2)
    lat1 *= DEG2RAD
    lat2 *= DEG2RAD
    lng1 *= DEG2RAD
    lng2 *= DEG2RAD

    a_x = lng1 - lng2
    a_y = lat1 - lat2

    p = (lat1 + lat2) / 2.0

    e = Math::sqrt((r_x ** 2 - r_y ** 2) / (r_x ** 2))

    w = Math::sqrt(1 - (e ** 2) * ((Math::sin(p)) ** 2))

    m = r_x * (1 - e ** 2) / (w ** 3)

    n = r_x / w

    d = (a_y * m) ** 2
    d += (a_x * n * Math::cos(p)) ** 2
    d = Math::sqrt(d)
    return d
  end

  def self.r_x
    case @gcs
    when 0
      r_x = BESSEL_R_X
    when 1
      r_x = GRS80_R_X
    when 2
      r_x = WGS84_R_X
    end
    return r_x
  end

  def self.r_y
    case @gcs
    when 0
      r_y = BESSEL_R_Y
    when 1
      r_y = GRS80_R_Y
    when 2
      r_y = WGS84_R_Y
    end
    return r_y
  end
end
