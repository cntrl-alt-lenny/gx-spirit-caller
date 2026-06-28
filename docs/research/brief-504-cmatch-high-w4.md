[//]: # (markdownlint-disable MD013 MD041)

# Brief 504 - C-match HIGH wave 4

**Branch:** `scaffolder/c-match-high-504`  
**PR:** #1042 (draft -> ready)  
**Gate:** MATCHED = function objdiff 100% + region `configure.py <ver>` + `ninja sha1` OK.

## Outcome

- **105 EUR HIGH candidates attempted** in INDEX order.
- **39 EUR HIGH C matches accepted** after strict objdiff 100% and repeated EUR sha1 gates.
- **66 EUR candidates parked** as HIGH-but-stubborn after compile miss or objdiff miss.
- **35 USA ports kept** and **35 JPN ports kept** after per-port objdiff 100% plus regional sha1.
- **4 USA/JPN ports deferred**: one low-confidence sibling resolution before write, three reverted after objdiff/missing-unit proof failed.
- **Remaining HIGH runway:** 1,042 eligible class A/B HIGH candidates by the same live filter; the pool is not thinning.

## EUR confirmed matches

| Addr |
|------|
| `02007240` |
| `0200a380` |
| `0200a994` |
| `0200aa60` |
| `0200ad0c` |
| `0200b59c` |
| `02012418` |
| `02019604` |
| `0201bf04` |
| `0201c560` |
| `0201c64c` |
| `0201d398` |
| `0201d5e8` |
| `0201f090` |
| `0201f1f8` |
| `0201f2bc` |
| `0201f2f4` |
| `020208c4` |
| `02020b24` |
| `02023f28` |
| `020245e8` |
| `02028754` |
| `02028804` |
| `0202ab64` |
| `0202aba0` |
| `0202af40` |
| `0202c028` |
| `0202c070` |
| `0202c3c8` |
| `0202c46c` |
| `0202effc` |
| `0202f430` |
| `0202f46c` |
| `0202f4cc` |
| `02031f40` |
| `0203309c` |
| `020331b0` |
| `02033654` |
| `02033808` |

## Port summary

| Region | Written for objdiff | Kept | Deferred/reverted | sha1 |
|--------|----------------------|------|-------------------|------|
| USA | 38 | 35 | 4 | OK |
| JPN | 38 | 35 | 4 | OK |

Deferred in both USA and JPN:

- `func_0201d398`: not written; callee `func_02092844` resolved LOW with a neighbor-shift anti-match note.
- `func_0200aa60`: written target `func_0200aa44`, then reverted; objdiff unit was missing, so no proof.
- `func_02033654`: written target `func_02033604`, then reverted; per-unit objdiff was 85.0%.
- `func_02033808`: written target `func_020337b8`, then reverted; per-unit objdiff was 75.0%.

Kept USA ports: `func_02007224`, `func_0200a364`, `func_0200a978`, `func_0200acf0`, `func_0200b580`, `func_020123e4`, `func_020195d0`, `func_0201bec4`, `func_0201c50c`, `func_0201c5f8`, `func_0201d594`, `func_0201f03c`, `func_0201f1a4`, `func_0201f268`, `func_0201f2a0`, `func_02020870`, `func_02020ad0`, `func_02023ed4`, `func_02024594`, `func_02028700`, `func_020287b0`, `func_0202ab10`, `func_0202ab4c`, `func_0202aeec`, `func_0202bfd4`, `func_0202c01c`, `func_0202c374`, `func_0202c418`, `func_0202efa8`, `func_0202f3dc`, `func_0202f418`, `func_0202f478`, `func_02031eec`, `func_02033048`, `func_0203315c`

Kept JPN ports: `func_02007224`, `func_0200a364`, `func_0200a978`, `func_0200acf0`, `func_0200b580`, `func_020123e4`, `func_020195d0`, `func_0201bec4`, `func_0201c50c`, `func_0201c5f8`, `func_0201d594`, `func_0201f03c`, `func_0201f1a4`, `func_0201f268`, `func_0201f2a0`, `func_02020870`, `func_02020ad0`, `func_02023ed4`, `func_02024594`, `func_02028700`, `func_020287b0`, `func_0202ab10`, `func_0202ab4c`, `func_0202aeec`, `func_0202bfd4`, `func_0202c01c`, `func_0202c374`, `func_0202c418`, `func_0202efa8`, `func_0202f3dc`, `func_0202f418`, `func_0202f478`, `func_02031eec`, `func_02033048`, `func_0203315c`

## Parked EUR candidates

`02006524`, `020071c4`, `02007f38`, `02007f58`, `0200a40c`, `0200a454`, `0200b0c8`, `0200b1bc`, `0200bff4`, `0200c23c`, `0200fbd4`, `02016b60`, `02017888`, `02017a98`, `02017afc`, `02017be0`, `02017d18`, `02017df0`, `0201816c`, `020186b0`, `02018b14`, `0201942c`, `02019820`, `020198ec`, `0201a0e0`, `0201a3ec`, `0201a498`, `0201b648`, `0201be64`, `0201cfa0`, `0201d5c0`, `0201e5b8`, `020206d8`, `0201ee1c`, `0201f6c0`, `0201f7f0`, `0201fbe0`, `02020398`, `02020814`, `0202111c`, `02021158`, `02021660`, `02021bac`, `020224c0`, `02025840`, `02027048`, `02029204`, `02029458`, `02029c80`, `0202a240`, `0202a27c`, `0202ab04`, `0202b6e4`, `0202bb88`, `0202c948`, `0202ce24`, `0202d194`, `0202d9a0`, `0203058c`, `02031794`, `020318b8`, `02032028`, `02032644`, `02032724`, `0203361c`, `020338b8`

## Cluster/yield notes

- HIGH remained productive but not the advertised 80% on this address band: 39/105 = 37.1% EUR accepted.
- Best adjacent cluster was `0202ab64` through `0202c46c`: 7/10 strict matches, all EUR-sha1 OK.
- Switch/dispatch cluster `0202effc`, `0202f430`, `0202f46c`, `0202f4cc` was 4/4 and ported where target proof held.
- Final linked-list/toggle neighborhood was 5/10 (`02031f40`, `0203309c`, `020331b0`, `02033654`, `02033808`), but the last two did not survive USA/JPN port objdiff.
- No MED-tier candidates were touched.

## Verification notes

- EUR accepted candidates were gated in six sha1-checked batches; no objdiff-only EUR match was accepted.
- Full USA/JPN `ninja report` hit an `objdiff-core` ARM panic (`arm.rs:130` index underflow). To avoid relying on a broken full report, each written USA/JPN port was verified with an isolated single-unit `objdiff-cli report generate`; non-100 or missing-unit ports were reverted before sha1.
- Final gates below were run after all reverts and report/index updates.

## Final sha1

```text
EUR  gx-spirit-caller_eur.nds: OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
USA  gx-spirit-caller_usa.nds: OK  (9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83)
JPN  gx-spirit-caller_jpn.nds: OK  (761fbfc62f4fe74f867e973a5eda91b8e86424f6)
```

## Throughput

Measured from first shipped commit (`2026-06-28T10:52:02+01:00`) to report write, not including preflight-only time:

- EUR accepted: 39 / 2.59 h = **15.0 funcs/hour**.
- Fully ported three-region keeps: 35 / 2.59 h = **13.5 funcs/hour**.

