# Brief 515 — C-match MED + retriage pool wave 6

Branch: `decomper/c-match-med-515`

Scope: dossier-guided MED work with the retriage pool first. HIGH A/B candidates were not touched. The regular MED-tail queue was not reached because the retriage pool still had active candidates but the post-match tail hit repeated containment or register-allocation walls.

## Result

- EUR matches accepted: 3
- USA ports accepted: 3
- JPN ports accepted: 3
- Edited/gated candidates: 19
- Dossiered reviewed candidates: 24
- No-dossier skip: 1
- Final gates:
  - `gx-spirit-caller_eur.nds: OK`
  - `gx-spirit-caller_usa.nds: OK`
  - `gx-spirit-caller_jpn.nds: OK`

All accepted matches were from the retriage pool. Each accepted EUR function passed containment, focused object comparison, and `ninja sha1`; each retained USA/JPN port was also gated through region SHA-1. The final publish gate reran `python tools/configure.py <region>` plus `ninja -j4 sha1` for all three regions.

## Yield by population

### Retriage pool

- Matches: 3 / 19 edited-gated attempts
- Edited-attempt yield: 15.8%
- Dossier-review yield: 3 / 24 = 12.5%
- Matches:
  - `021aa540` (`ov022`) — corrected switch mapping and return-value liveness; ported to USA/JPN with regional data/callee mappings.
  - `021b299c` (`ov007`) — tiny global-state setter/caller; ported to USA/JPN with the uniform ov007 data/BSS shift.
  - `021ac72c` (`ov000`) — deferred-task ready-bit callback gate; ported to USA/JPN at `021ac64c`.
- Ports:
  - USA: 3 / 3 accepted
  - JPN: 3 / 3 accepted

### Regular MED-tail dossiers

- Matches: 0 / 0 attempted
- Yield: not reached

The lane stayed on the requested retriage-first priority for the whole wave. After the third match, additional retriage probes repeatedly hit containment failures or small register/code-size walls, so the wave closed without entering the regular MED-tail queue.

## Parked and skipped

Edited/gated parks:

- `0204bf44` — avalanche in ARM9 main; first outside diff at `0x020008f8`.
- `0204ca70` — avalanche/size growth in ARM9 main; first outside diff at `0x020008f8`.
- `020a724c` — contained vtable thunk, but C always selected `r0` where original uses `r2`; multiple pointer/volatile shapes failed.
- `02009dec` — avalanche in ARM9 main; first outside diff at `0x020008f8`.
- `021aa6e0` (`ov022`) — avalanche in ov022 after the direct 6-arg stack-pack shape.
- `021ab330` (`ov022`) — contained store-scheduling wall; remaining mismatch was literal-load vs `str [r4,#0xc]` order.
- `021ab5c8` (`ov022`) — permuter-class HSV/RGB divmod body; direct attempt avalanched.
- `021ab760` (`ov022`) — contained clamp/reg-allocation wall after bounded pointer-local reshapes.
- `021b2a48` (`ov019`) — permuter-class large callee-saved body; direct attempt avalanched/grew.
- `021ab364` (`ov020`) — contained tilemap register-rotation wall.
- `021aa5f0` (`ov008`) — avalanche in ov008.
- `021ab798` (`ov000`) — first alpha-step shape contained but was a large register/idiom mismatch; the signed-magic reshape escaped containment, so parked.
- `021aa8d4` (`ov000`) — fixed-point angle candidate avalanched on first build.
- `021b2514` (`ov015`) — leaf short-field store chain grew/spilled past the candidate end into the next function.
- `021add24` (`ov020`) — contained divmod loop near-miss; exact register lifetime reshape introduced a mask/code-size spill, so parked.
- `021aaf5c` (`ov021`) — reserved-ID scan candidate avalanched on first build.

Dossiered no-edit parks/skips:

- `021ab43c` (`ov020`) — same clone/register-rotation wall as parked `021ab364`.
- `021ac2ac` (`ov008`) — dossier marks hard Mode-D duplicate-pool-word `.s`-only.
- `021acfa0` (`ov008`) — dossier records prior no-match after long permuter run.
- `021b27d8` (`ov015`) — dossier explicitly calls out the known `stmia sp,{...}` permuter wall.
- `021aab7c` (`ov021`) — dossier marks the prep as truncated/permuter-class; skipped pending full re-extraction.

Other skip:

- `021b28a8` (`ov015`) — present in retriage notes but no `docs/research/dossiers/021b28a8.md`, so skipped under brief 515's dossier-first rule.

## Cluster notes

- `ov022`: 1 match (`021aa540`) from five edited/reviewed candidates; remaining ov022 work hit stack-pack, store-schedule, divmod, or clamp walls.
- `ov020`: the `021ab364`/`021ab43c` tilemap clone pair stayed parked together; `021add24` was a close but non-contained divmod/register-lifetime wall.
- `ov007` and `ov000`: one single-function match each.

## Throughput and runway

- Commit-window throughput: 3 EUR matches landed across three commits before final report/index overhead.
- Remaining retriage runway: still substantial, but the immediately probed post-match tail was much thinner than wave 513's 50% pool slice. The best next use of the pool is likely cluster-first on untried ov006/ov011 dossier groups, not more singleton main/ov000/ov020 tail probing.
- Remaining MED-tail runway: untouched in this wave; continue from the regular dossier order only after the brain decides the retriage-first tranche is exhausted enough.
