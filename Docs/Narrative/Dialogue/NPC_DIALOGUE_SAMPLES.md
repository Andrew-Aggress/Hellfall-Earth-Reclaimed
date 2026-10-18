# NPC Dialogue Samples

## Mara Venn — mission support

### First contact

**MARA:** Operative Thorne, confirm motor control.

**ROOK:** Confirmed.

**MARA:** Confirm weapons access.

**ROOK:** Working on it.

**MARA:** That was not one of the available answers.

### Optional secret found

**MARA:** You found an unlisted chamber.

**ROOK:** You knew it was here.

**MARA:** I knew the bunker had a missing room. I did not know what it contained.

**ROOK:** Now you do.

**MARA:** Now I know someone expected the bunker to fall.

## Dr. Elias Soren — human ally

### First meeting

**SOREN:** Stop. If you are with Aegis, I will not open the door.

**ROOK:** I am Aegis.

**SOREN:** Then you are three years too late.

**ROOK:** Open the door.

**SOREN:** Give me one reason.

**ROOK:** I am going to the gate.

**SOREN:** That is not a reason. That is a death wish.

**ROOK:** Open the door.

### After optional rescue

**SOREN:** You could have left us.

**ROOK:** I considered it.

**SOREN:** Why didn’t you?

**ROOK:** You had the map.

**SOREN:** Of course.

**ROOK:** And you were still alive.

## Civilian survivor — ambient NPC

**SURVIVOR:** The lights went out first. Then the sky opened.

**ROOK:** How many made it out?

**SURVIVOR:** Enough to remember the way back.

**ROOK:** Stay below the relay line.

**SURVIVOR:** Are you coming back?

**ROOK:** If the door is still there.

## Enemy barks

### Razor-Stalker

- “Target moving.”
- “Close the gap.”
- “Break the line.”
- “Prey cornered.”

### Phalanx Trooper

- “Shield forward.”
- “Advance.”
- “Rear exposed.”
- “Signal lost.”

## Localization rules

Every line receives a stable key and voice metadata:

```text
Dialogue.Mara.E1M1.FirstContact
Dialogue.Soren.E1M2.FirstMeeting
Dialogue.Survivor.E1M2.Ambient01
Dialogue.RazorStalker.Alert01
Dialogue.PhalanxTrooper.ShieldDown01
```

Metadata should include speaker, subtitle duration, audio asset, priority, interruptibility, and localization status for `en`, `uk`, `ru`, `de`, `pl`, `fr`, and `it`.
