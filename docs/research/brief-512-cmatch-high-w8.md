[//]: # (markdownlint-disable MD013 MD041)

# Brief 512 - C-match HIGH wave 8 ground-truth test

**Branch:** `scaffolder/c-match-high-512`  
**Gate:** MATCHED = region `ninja sha1` OK. Raw objdiff/per-unit report was scouting only.

## Outcome

- **119 unique EUR HIGH A/B candidates** were dossier-read and attempted in INDEX order.
- **0 EUR matches accepted.**
- **119 candidates parked/deferred**:
  - 112 objdiff/per-unit-report 100% candidates failed EUR ROM sha1.
  - 4 prep sources were parked before build because the dossier GROUND TRUTH exposed non-exact data-symbol aliases.
  - 3 candidates failed the per-unit objdiff/report check before sha1.
- **0 USA/JPN ports** were attempted because there were no EUR matches to port.
- **Remaining HIGH A/B runway:** 901 eligible candidates by the wave driver rules, after this negative sample.

## Yield versus baseline

- Brief 510 baseline: **40 / 180 objdiff scouts = 22.2%** strict EUR acceptance; **40 / 124 sha1-classified = 32.3%** within the gated set.
- Brief 512 ground-truth sample: **0 / 119 unique candidates = 0.0%** strict EUR acceptance.
- Result: the dossiers did **not** lift the first old-fail HIGH tranche. They are still valuable as a guardrail, but correct pool/callee names alone did not convert this region of the pool into shippable C.

## Ground-truth enforcement notes

- Every candidate had `docs/research/dossiers-high/<addr>.md` read before applying C.
- The helper was tightened during the run to parse `.L_...` pool labels as well as `_LITn`, and to require exact C-token matches rather than substring matches.
- Exact-token enforcement caught four stale prep aliases:
  - `0201f6c0`: `data_020c6578_obj` vs GROUND TRUTH `data_020c6578`
  - `0201fbe0`: `data_020c6670_obj` vs GROUND TRUTH `data_020c6670`
  - `0202a240`: `data_0219a934_alias` vs GROUND TRUTH `data_0219a934`
  - `0202a27c`: `data_0219a934_alias` vs GROUND TRUTH `data_0219a934`
- Those were parked as `dossier-source-invalid`; I did not force ad-hoc rewrites because conflicting extern types in the old prep C need a small dedicated rework pass.
- No `static const` / initialized-static candidates were accepted; the helper rejects initialized statics as Mode-C risk.

## Attempted range

First attempted candidates:

`02001e5c`, `0200592c`, `02006524`, `020071c4`, `02007f38`, `02007f58`, `0200a40c`, `0200a454`, `0200b0c8`, `0200b1bc`

Last attempted candidates:

`02040de8`, `020414b0`, `02041520`, `02041dbc`, `02041ea0`, `02042190`, `0204320c`, `020442f8`, `02044328`, `02044724`

Next eligible candidates after stopping:

`02045678`, `02045744`, `020457d8`, `020458d8`, `02045c34`, `02045c7c`, `02045cb8`, `02046694`, `020469d0`, `02046a5c`, `02046ae0`, `02046b3c`, `02046ba8`, `02048050`, `020490dc`

## Verification notes

- EUR baseline after fast-forward passed before the resumed run.
- Per-unit `objdiff-cli report generate` was used; full-region `ninja report` was not run, per the brief warning that bad units can panic it.
- `objdiff-cli diff --help` was checked; this local CLI exposes `diff` and `report generate`, but no explicit resolved-diff flag. The practical resolved check used here was the existing single-unit report path plus exact dossier-token validation.
- The first command timed out locally while the helper was still inside in-scope EUR sha1 work. I waited for the exact helper/build child processes, then recovered its completed classifications.
- During that recovery, `origin/main` had advanced by docs/research-only commits. I restored trial `.s` stat noise, fast-forwarded, reran the EUR baseline green, and seeded only the already-classified 40-candidate pilot evidence because no `src/` or `config/` code changed across the fast-forward.

## Final sha1

```text
EUR  gx-spirit-caller_eur.nds: OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
USA  gx-spirit-caller_usa.nds: OK  (9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83)
JPN  gx-spirit-caller_jpn.nds: OK  (761fbfc62f4fe74f867e973a5eda91b8e86424f6)
```

## Conclusion

This was a useful ground-truth test, but a negative one: exact pool/callee dossiers catch some stale prep mistakes and prevent Mode A/B false confidence, yet the first 119 old HIGH candidates still produced **0** sha1-clean C matches. The next lever should be either a dedicated rewrite pass for the four exact-symbol alias parks or a different HIGH subpool selection, not an endless serial sha1 grind on this tranche.
