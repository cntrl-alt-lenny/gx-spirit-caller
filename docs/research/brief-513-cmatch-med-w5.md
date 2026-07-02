# Brief 513 — C-match MED dossier wave 5

Branch: `decomper/c-match-med-513`

Scope: dossier-guided MED work while the HIGH forensics lane ran. This wave mixed the regular MED-tail dossier queue with dossiered retriage-pool candidates. HIGH A/B candidates were not touched.

## Result

- EUR matches accepted: 10
- USA ports accepted: 10
- JPN ports accepted: 10
- Parked/review-deferred: 7 parked + 2 same-failure retriage skips
- Final gates:
  - `gx-spirit-caller_eur.nds: OK`
  - `gx-spirit-caller_usa.nds: OK`
  - `gx-spirit-caller_jpn.nds: OK`

The wave reached the lower bound of the 10-15 target and stopped after `020157d4`, with final 3-region SHA-1 gates green.

## Yield by population

### Retriage pool

- Matched: 3 / 6 attempted or directly reviewed
- Yield: 50.0%
- Matches:
  - `02001ddc`
  - `02001e94`
  - `02005298`
- Parked:
  - `0201d47c` — bytefield read-modify-write temp coalesced into the wrong register after the best `int`-return reshape.
  - `020a71e4` — vtable dispatch shape matched except the `blx` call register selected `r0` instead of original `r3`.
  - `020b319c` — FX conversion compiled to the runtime helper tailcall instead of the original inline CLZ/rounding body.
- Same-failure skips:
  - `020b1e0c`, `020b1e4c` — same FX SDK inline-conversion failure mode as `020b319c`; not worth another full attempt in this wave.

### Regular MED-tail dossiers

- Matched: 7 / 11 attempted or directly reviewed
- Yield: 63.6%
- Matches:
  - `0202a1cc`
  - `02013aa0`
  - `02013b4c`
  - `02014814`
  - `02014b28`
  - `02015638`
  - `020157d4`
- Parked:
  - `020125ac` — register-allocation wall around pre-call base/constant register assignment.
  - `020138b8` — one real pre-loop branch-condition mismatch remained (`bls` vs `beq`); explicit EUR `ninja sha1` failed.
  - `020139fc` — skipped as permuter-class constant-fold/magic-divide wall per dossier risk.
  - `02015190` — all bodies aligned, but the nested jump-table empty/default entries were emitted as branches to a shared epilogue instead of inline returns.

## Notable reshape wins

- `02013b4c`: corrected the prep's off-by-one switch mapping from the `.s`; using `break` cases produced the original inline jump-table epilogues.
- `02014814`: moved case-2 after case-3 in source order so the jump table and literal pool matched the original layout.
- `02014b28`: used the dossier's explicit if/goto compare chain to avoid a jump table.
- `02015638`: forced the `func_020195ec != 0` arm through an explicit `goto` so mwcc emitted the original branch layout instead of predicated stores.
- `020157d4`: used the `.s` table mapping rather than the prep's off-by-one case map; source order `1/5/4/3/2` matched the original body layout.

## Throughput and runway

- Commit-window throughput: 10 EUR matches from 2026-07-01 21:51:55+01:00 to 2026-07-02 01:21:28+01:00, about 2.9 EUR matches/hour before final report/index overhead.
- Remaining dossier runway: `docs/research/dossiers/INDEX.md` has 500 addresses; `020157d4` is index 12, leaving 487 entries after this stop point before done-skip filtering.
- Next regular MED-tail candidate in dossier order: `02015974`, then `02015e00`, `020161ac`, `020162d0`, `0201660c`, `020169d0`. `02018a84` is a known prior park and should be skipped unless new guidance says otherwise.

## Validation notes

Each accepted EUR match was gated with a clean per-unit resolved diff where practical and an explicit `ninja sha1`. Each retained USA/JPN port was gated with per-unit resolved diff and `ninja sha1`. The final publish gate reran `python tools/configure.py <region>` plus `ninja -j4 sha1` for all three regions and produced the OK lines above.
