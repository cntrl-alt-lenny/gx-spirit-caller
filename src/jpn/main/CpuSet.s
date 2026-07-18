; CpuSet: NDS ARM9 BIOS SWI 0xb thunk (4-byte Thumb).
;
; Ported to .s for JPN because the mwcc-ARM `.text` alignment wall
; (docs/research/thumb-align-wall.md) blocks these from shipping as C
; at a start address that isn't 4-aligned — true for this thunk's JPN
; link position (0x02000236, 2-aligned only) even though USA's copy of
; the same thunk lands 4-aligned (0x02000320) and ships as .c there.
; Same recipe as EUR's own already-shipped non-4-aligned thunks (e.g.
; src/main/SoftReset.s, src/main/Div.s) and USA's brief-601 re-land
; fixes (e.g. src/usa/main/Halt.s).

        .text

        .global CpuSet
        .thumb
CpuSet:
        swi     0xb
        bx      lr
