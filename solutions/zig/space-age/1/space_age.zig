pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const earth_year_in_seconds: f64 = 31_557_600;
        const orbital_period_in_earth_years: f64 = switch (self) {
            .mercury => 0.2408467,
            .venus => 0.61519726,
            .earth => 1,
            .mars => 1.8808158,
            .jupiter => 11.862615,
            .saturn => 29.447498,
            .uranus => 84.016846,
            .neptune => 164.79132,
        };

        const earth_years: f64 = @as(f64, @floatFromInt(seconds)) / earth_year_in_seconds;
        return earth_years / orbital_period_in_earth_years;
    }
};
