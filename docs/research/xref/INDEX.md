[//]: # (markdownlint-disable MD013 MD041)

# Function ↔ Type / Data / Constants Cross-Reference

This directory provides the index that makes KB docs actionable for C-matching.
For each known struct or global, which functions touch it; and for each unmatched
MED candidate, which KB docs to consult.

> Branch: `kb/types-round3`
> Do NOT regenerate — the brain handles the index at merge.

---

## Files

| File | Contents |
|------|---------|
| [StructToFunction.md](StructToFunction.md) | For each recovered struct/global: the functions (matched .c/.s files) that access it. Use this to deepen a struct's field list. |
| [MedCandidateNeeds.md](MedCandidateNeeds.md) | For each MED candidate cluster (by module): what structs/data/constants KB docs to consult. Use this when picking up a candidate. |

---

## Quick lookup: which xref doc to use

| I want to... | Use... |
|--------------|--------|
| Find more callers of `DuelStateSingleton` to recover more fields | [StructToFunction.md](StructToFunction.md) § DuelStateSingleton |
| Know what types a new ov002 MED candidate likely needs | [MedCandidateNeeds.md](MedCandidateNeeds.md) § ov002 |
| Know what types a new main MED candidate likely needs | [MedCandidateNeeds.md](MedCandidateNeeds.md) § main |
| Know what types a new ov006 MED candidate likely needs | [MedCandidateNeeds.md](MedCandidateNeeds.md) § ov006 |
| Find all functions that touch the PerPlayerRowTable | [StructToFunction.md](StructToFunction.md) § PerPlayerRowTable |
| Find all functions that touch GlobalAudioState | [StructToFunction.md](StructToFunction.md) § GlobalAudioState |

---

## Struct inventory (cross-reference to types/)

| Struct | Global symbol | KB Doc | Xref entry |
|--------|--------------|--------|-----------|
| `DuelStateSingleton` | `data_ov002_022d016c` | [types/DuelStateSingleton.md](../types/DuelStateSingleton.md) | [StructToFunction.md](StructToFunction.md) |
| `PerPlayerRowTable` | `data_ov002_022cf16c` | [types/PerPlayerRowTable.md](../types/PerPlayerRowTable.md) | [StructToFunction.md](StructToFunction.md) |
| `DuelQueueState` | `data_ov002_022ce288` | [types/DuelQueueState.md](../types/DuelQueueState.md) | [StructToFunction.md](StructToFunction.md) |
| `GlobalAudioState` | `data_021040ac` | [types/GlobalAudioState.md](../types/GlobalAudioState.md) | [StructToFunction.md](StructToFunction.md) |
| `GlobalData02104bac` | `data_02104bac` | [types/GlobalData02104bac.md](../types/GlobalData02104bac.md) | [StructToFunction.md](StructToFunction.md) |
| `GlobalData02104e6c` | `data_02104e6c` | [types/GlobalData02104e6c.md](../types/GlobalData02104e6c.md) | [StructToFunction.md](StructToFunction.md) |
| `GlobalData02104f1c` | `data_02104f1c` | [types/GlobalData02104f1c.md](../types/GlobalData02104f1c.md) | [StructToFunction.md](StructToFunction.md) |
| `GlobalData02102c7c` | `data_02102c7c` | [types/GlobalData02102c7c.md](../types/GlobalData02102c7c.md) | [StructToFunction.md](StructToFunction.md) |
| `GameSingleton` | via `func_020498f0()` | [types/GameSingleton.md](../types/GameSingleton.md) | [StructToFunction.md](StructToFunction.md) |
| `EntityStruct0x284` | array at 0x02186BC8 | [types/EntityStruct0x284.md](../types/EntityStruct0x284.md) | [StructToFunction.md](StructToFunction.md) |
| `Ov002Self` | `self` arg | [types/Ov002SelfContext.md](../types/Ov002SelfContext.md) | N/A (4-byte handle, no xref needed) |

---

## MED candidate module summary

| Module | MED count | Primary struct dependencies | Primary constant dependencies |
|--------|-----------|---------------------------|-------------------------------|
| ov002 | 1,408 | DuelStateSingleton, PerPlayerRowTable, DuelQueueState | 0x23 wildcard, DuelPhase 0–3, 0x7F/0x80 |
| main | 967 | GameSingleton, EntityStruct0x284, GlobalAudioState | Card ID ranges, 0x2F07 flag mask |
| ov006 | 73 | Ov006StateRecord (see data/Ov004Ov006DataTables.md) | ObjState 0–3, event codes |
| ov004 | 44 | local per-function structs, large rodata arrays | Animation frame counts |
| ov011 | 41 | local structs, event sink callbacks | Event codes 0x6A, MMIO constants |
| ov000 | 25 | GameSingleton, overlay loader structs | System mode codes |
| ov008 | 31 | ov008 local state | Timer constants |

See [MedCandidateNeeds.md](MedCandidateNeeds.md) for the detailed per-candidate analysis.
