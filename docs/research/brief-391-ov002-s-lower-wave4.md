[//]: # (markdownlint-disable MD013 MD041)

# Brief 391 — ov002 `.s` lower-half wave 4

**Brief:** 391 (decomper). Wave 4 of the ov002 lower-half `.s` drain (waves 1-3 =
briefs 385/387/389, PRs #909/#911/#913). The durable delinks-collision fix
(`tools/sort_delinks.py`, brief 389) is now on `main` and working. Continue the
lower-half reg-alloc / plateau drain; `asm_escape --whole-function`; gate 3-region
`ninja sha1`. Target ~10. Windows lane.

## Result

- **18 ov002 lower-half functions shipped as byte-exact `.s`** (target ~10) —
  3-region `ninja sha1` (EUR / USA / JPN) all `OK`.
- **The delinks discipline works**: appended carves, ran `sort_delinks.py`, blocks
  landed in the sorted lower region. **0 kind:data drops** this wave.

## The 18 ships

Uncarved lower-half reg-alloc / plateau-class leaves, the 0x54 / 0x58 size band,
each `asm_escape --whole-function`-verified byte-identical and kind:data-screened.

| function | size | function | size | function | size |
|---|---|---|---|---|---|
| `func_ov002_021ba0b0` | 0x54 | `func_ov002_0220d804` | 0x54 | `func_ov002_021bad58` | 0x58 |
| `func_ov002_021bbd54` | 0x54 | `func_ov002_021ae4bc` | 0x58 | `func_ov002_021bc07c` | 0x58 |
| `func_ov002_021df62c` | 0x54 | `func_ov002_021b1cf0` | 0x58 | `func_ov002_021d0f48` | 0x58 |
| `func_ov002_02201de4` | 0x54 | `func_ov002_021b21e8` | 0x58 | `func_ov002_021d5b28` | 0x58 |
| `func_ov002_02202d08` | 0x54 | `func_ov002_021b3dd0` | 0x58 | `func_ov002_021d5fb4` | 0x58 |
| `func_ov002_02203738` | 0x54 | | | | |
| `func_ov002_02205c4c` | 0x54 | | | | |
| `func_ov002_0220b5e0` | 0x54 | | | | |

18/18 verified, **0 kind:data**. (The lower half stays data-light in this band —
contrast the scaffolder's upper half, which hits ~25% kind:data at 0x50-0x60.)

## Delinks discipline + a one-time #912 absorption

Followed the brief-389 discipline: append carve blocks, then
`python tools/sort_delinks.py config/eur/arm9/overlays/ov002/delinks.txt`.

**Heads-up for the scaffolder:** `main` had **1 inversion** when I branched —
PR #912 (scaffolder wave 10) appended its 8 upper-half blocks **without** running
`sort_delinks.py` (the tool had only just landed in #913). My `sort_delinks.py`
run absorbed it: the delinks diff in this PR therefore also **re-sorts those 8
upper-half blocks** into their canonical position (a one-time fixup, ~32 lines in
the upper region). This is the discipline self-healing the file — but it only
converges if **both** lanes run `sort_delinks.py` every wave. Please adopt it,
@scaffolder.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.

## Runway (not thinning)

After waves 1-4 (**56 lower-half ships**), **~260 uncarved ≤0x80 lower-half
candidates remain** (and far more above 0x80). Steady multi-wave runway; the
0x54/0x58 band is the current seam.
