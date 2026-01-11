Timer.Wait(function()

    -- override unconsciousness so adrenalinerush works
    NT.Afflictions.sym_unconsciousness = {
		update = function(c, i)
			local isUnconscious = not NTC.GetSymptomFalse(c.character, i)
				and (
					NTC.GetSymptom(c.character, i)
					or c.stats.stasis
					or c.afflictions.brainremoved.strength > 0
					or (not HF.HasAffliction(c.character, "implacable", 0.05) and (c.character.Vitality <= 0 or c.afflictions.hypoxemia.strength > 80))
					or c.afflictions.cerebralhypoxia.strength > 100
					or c.afflictions.coma.strength > 15
					or c.afflictions.t_arterialcut.strength > 0
					or c.afflictions.seizure.strength > 0.1
					or c.afflictions.opiateoverdose.strength > 60

                    or (not HF.HasAffliction(c.character, "adrenalinerush", 0.05) and c.afflictions.hypoxemia.strength > 80)
				)
			c.afflictions[i].strength = HF.BoolToNum(isUnconscious, 2)
		end,
	}
end, 1)