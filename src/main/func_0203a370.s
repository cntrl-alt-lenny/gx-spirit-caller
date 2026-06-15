; func_0203a370 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b314
        .extern data_0219c480
        .extern func_02034a84
        .extern func_02038ddc
        .extern func_02038f3c
        .extern func_02039690
        .extern func_020399dc
        .extern func_0203a150
        .extern func_0203a694
        .extern func_0203a6e8
        .extern func_0203a744
        .extern func_0203a780
        .extern func_0203aae8
        .extern func_0203c6f8
        .global func_0203a370
        .arm
func_0203a370:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r3, _LIT0
    mov r9, r0
    ldrh r0, [r3, #0x4]
    mov r8, r1
    ldr r1, _LIT1
    cmp r0, #0x0
    ldr r3, [r1]
    orrne r8, r8, #0x80
    mov r0, r9, lsl #0x10
    mov r7, r2
    mov r2, r0, lsr #0x10
    mov r1, #0xc
    mla r4, r2, r1, r3
    orrne r8, r8, #0x8000
    mov r0, r9
    bl func_02034a84
    mov r1, r8
    mov r9, r0
    bl func_02038ddc
    movs r5, r0
    beq .L_1868
    mov r2, r9
    mvn r1, #0x0
    bl func_02038f3c
    mov r0, r9, lsr #0x14
    and r0, r0, #0xf
    cmp r0, #0xb
    mov r6, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_1820
    b .L_1820
    b .L_1784
    b .L_17d4
    b .L_17f4
    b .L_17b4
    b .L_1820
    b .L_1820
    b .L_1820
    b .L_179c
    b .L_1820
    b .L_17dc
    b .L_17f4
.L_1784:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a6e8
    mov r6, r0
    b .L_1820
.L_179c:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a694
    mov r6, r0
    b .L_1820
.L_17b4:
    mov r0, r7
    bl func_0203c6f8
    mov r1, r9, lsl #0x10
    mov r2, r8
    mov r1, r1, lsr #0x10
    bl func_02039690
    mov r6, r0
    b .L_1820
.L_17d4:
    mov r6, #0x1
    b .L_1820
.L_17dc:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a780
    mov r6, r0
    b .L_1820
.L_17f4:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a744
    movs r6, r0
    beq .L_1820
    ldrh r1, [r4, #0x4]
    mov r0, r5
    mov r2, r8
    bl func_0203a694
    mov r6, r0
.L_1820:
    cmp r6, #0x0
    beq .L_1844
    tst r8, #0x8000
    beq .L_1844
    mov r0, r5
    mov r1, r8
    bl func_020399dc
    cmp r0, #0x0
    movle r6, #0x0
.L_1844:
    cmp r6, #0x0
    mov r0, r5
    beq .L_1860
    mov r1, r9
    mov r2, r8
    bl func_0203a150
    b .L_1868
.L_1860:
    bl func_0203aae8
    mov r5, #0x0
.L_1868:
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1, #0x10]
    mov r0, r5
    str r2, [r1, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219c480
_LIT1: .word data_0219b314
