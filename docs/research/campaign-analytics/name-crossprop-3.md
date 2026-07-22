# Cross-region name propagation sweep 3

Snapshot: 2026-07-22. This is a build-free naming census. The source of truth
was the current EUR/USA/JPN `symbols.txt` set, checked against the committed
signature DB and dry-applied signatures; no byte or ROM content was changed.

## Sweep result

EUR has 72 real-named functions. USA and JPN each have 61. The 11 EUR names
missing from each target region were all tested with their EUR signature against
the target config. Every one was ambiguous (`Multiple matching functions
found`), so none was guessed or propagated.

The only unambiguous twin found by the sweep was the shared address
`0x02018b70`, already applied by the preceding signature-refresh item:

| EUR name | USA | JPN | action |
|---|---|---|---|
| `SysWork_ClearField0x810` | `func_02018b70` → `SysWork_ClearField0x810` | `func_02018b70` → `SysWork_ClearField0x810` | `rename_symbol.py --cascade` in both regions |

**Twins propagated by this queue lane: 2 region instances (1 EUR name × USA/JPN).**

## Missing-name ledger

These 11 names are absent from both USA and JPN. Each returned an ambiguous
signature match in both target regions, so the validated fallback could not
select a unique address:

| EUR name | USA result | JPN result |
|---|---|---|
| `Ov006_FullInit` | multiple | multiple |
| `Ov014_HitTestSecondary` | multiple | multiple |
| `Ov015_DrawStatusFields` | multiple | multiple |
| `Ov015_InitScroller` | multiple | multiple |
| `Ov015_RegisterCallbacks` | multiple | multiple |
| `Ov015_SelectVramBank` | multiple | multiple |
| `Ov015_SelectVramBankSub` | multiple | multiple |
| `Ov015_UpdateScrollTarget` | multiple | multiple |
| `Task_Invoke` | multiple | multiple |
| `Vram_GetBankBaseCD` | multiple | multiple |
| `Vram_GetBankBaseE` | multiple | multiple |

This is **0/22 unique target resolutions** for the unresolved-name set, not
evidence that the functions are absent. The signatures are masked-identical to
multiple target functions; resolving those families needs an independent
address discriminator or manual family mapping.

## Gates

The all-region gate runner returned exit 0 for each command:

```text
dsd check modules -c config/eur/arm9/config.yaml -f
dsd check modules -c config/usa/arm9/config.yaml -f
dsd check modules -c config/jpn/arm9/config.yaml -f
```

Each region reported `OK` for ARM9 main, ITCM, DTCM, and overlays 0 through 23.
The naming gate passed:

```text
python tools/scope_gate.py --kind naming --base origin/main
PASS scope        real-named delta = 194 across 3 region(s) (eur:72, usa:61, jpn:61); target 1
PASS dup-symbol   no function name bound to 2+ addresses in any region
PASS cascade      no placeholder names were renamed away (nothing to cascade)
scope_gate: PASS — scope met, no dup-symbol, renames fully cascaded.
```

The 194 total includes the stacked naming changes from earlier queue PRs; this
sweep's concrete contribution is the two cascaded region instances shown
above. `git diff --check` also passes.
