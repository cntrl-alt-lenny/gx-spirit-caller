; func_020988a8 — genuine C-34 (cm-parked-reaudit-2 batch B,
; 2026-07-25): confirmed real duplicate pool slot for data_02102c44
; (symbol at .L_0209899c + literal 0x02102c44 at .L_020989a0, used in a
; `sub ip, r1(symbol), r3(literal)` bounds-check that always evaluates
; to 0 -- mwcc can't fold it at compile time since one side is an
; unresolved symbol). Literal-address-cast applies (both accesses are
; offset-0). ALSO needed tier routing: the epilogue is orig's separate
; `pop {r4,r5,r6,lr}` + `bx lr` (not fused `pop{regs,pc}`) at all 3
; return points, matching `.legacy.c` (mwccarm 1.2/sp2p3) -- confirmed
; by testing: under the default 2.0/sp1p5 tier a plain C translation
; also mismatches the push list ({r3,r4,r5} vs {r4,r5,r6}) and emits
; `tst` where orig emits `ands` (result byte unused either way, but the
; encoding differs); switching to `.legacy.c` fixed BOTH of those
; instantly, no source change needed.
;
; Residual after both levers (best reached: 16.67%, 66 words vs orig's
; 64): mwcc 1.2/sp2p3 insists on canonicalizing
; `(int)&data_02102c44 - 0x02102c44` into `symbol + (-0x02102c44)` --
; i.e. it materializes a SECOND, NEGATED copy of the same literal in the
; pool and emits `add` instead of orig's plain `sub ip, r1, r3` with the
; positive literal reused from the pool word already loaded for the
; later `mla` indexing. Tried: hoisting the literal into a local
; (still constant-propagated, no change), `volatile` on that local
; (defeats constant folding but also forces a real stack slot --
; completely different shape, much worse), unsigned arithmetic (changes
; the division reciprocal algorithm itself, `umull`/0xcccccccd instead
; of orig's signed `smull`/0x66666667 -- worse). The likely real fix is
; the OTHER anti-CSE lever (a second registered symbol instead of a
; literal, exactly as the C-34 doc recommends for constructs like this)
; -- but data_02102c44 sits in an UNCLAIMED 0x02102c1c-0x02102c60 gap of
; the giant unclaimed `.data` blob (config/eur/arm9/delinks.txt: no TU
; entry spans it), so adding an alias here means claiming that gap with
; a new byte-exact data TU first, not just a symbols.txt/BSS-split edit
; like the data_0219a924-family aliases -- out of scope for a lever-
; application pass. Left as `.s`.

        .text
        .extern data_02102c44
        .extern func_02000950
        .extern func_02092904
        .extern func_02093bfc
        .extern func_020945f4
        .extern func_020989a8
        .extern func_02098cdc
        .global func_020988a8
        .arm
func_020988a8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_02098cdc
    ldr r1, .L_02098998
    mov r4, r0
    ldrh r0, [r1, #0x0]
    cmp r0, #0x2
    bne .L_0209893c
    ldrb r1, [r5, #0x1f]
    mov r0, #0x0
    ands r1, r1, #0x2
    beq .L_02098918
    ldr r1, .L_0209899c
    ldr r3, .L_020989a0
    ldr r2, .L_020989a4
    sub ip, r1, r3
    smull r1, lr, r2, ip
    mov lr, lr, asr #0x3
    mov r1, ip, lsr #0x1f
    ldr r2, [r5, #0x0]
    add lr, r1, lr
    cmp r2, lr
    bhs .L_02098918
    mov r0, #0x14
    mla r0, r2, r0, r3
    ldr r1, [r5, #0x4]
    mov r2, r4
    bl func_020989a8
.L_02098918:
    cmp r0, #0x0
    bne .L_0209893c
    ldr r0, [r5, #0x4]
    mov r2, r4
    mov r1, #0x0
    bl func_020945f4
    bl func_02093bfc
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_0209893c:
    ldrb r0, [r5, #0x1f]
    ands r0, r0, #0x1
    beq .L_02098954
    ldr r0, [r5, #0x4]
    add r0, r0, r4
    bl func_02000950
.L_02098954:
    ldr r0, [r5, #0x4]
    ldr r1, [r5, #0x8]
    bl func_02092904
    ldr r6, [r5, #0x10]
    ldr r4, [r5, #0x14]
    cmp r6, r4
    ldmhsia sp!, {r4, r5, r6, lr}
    bxhs lr
.L_02098974:
    ldr r0, [r6, #0x0]
    cmp r0, #0x0
    beq .L_02098984
    blx r0
.L_02098984:
    add r6, r6, #0x4
    cmp r6, r4
    blo .L_02098974
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_02098998: .word 0x27ffc40
.L_0209899c:
        .word   data_02102c44
.L_020989a0:
        .word   0x02102c44                       ; literal value of `data_02102c44` — bypasses patcher trim
.L_020989a4: .word 0x66666667
