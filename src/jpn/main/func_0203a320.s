; func_0203a320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b234
        .extern data_0219c3a0
        .extern func_02034a34
        .extern func_02038d8c
        .extern func_02038eec
        .extern func_02039640
        .extern func_0203998c
        .extern func_0203a100
        .extern func_0203a644
        .extern func_0203a698
        .extern func_0203a6f4
        .extern func_0203a730
        .extern func_0203aa98
        .extern func_0203c6a8
        .global func_0203a320
        .arm
func_0203a320:
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
    bl func_02034a34
    mov r1, r8
    mov r9, r0
    bl func_02038d8c
    movs r5, r0
    beq .L_36c
    mov r2, r9
    mvn r1, #0x0
    bl func_02038eec
    mov r0, r9, lsr #0x14
    and r0, r0, #0xf
    cmp r0, #0xb
    mov r6, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_324
    b .L_324
    b .L_288
    b .L_2d8
    b .L_2f8
    b .L_2b8
    b .L_324
    b .L_324
    b .L_324
    b .L_2a0
    b .L_324
    b .L_2e0
    b .L_2f8
.L_288:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a698
    mov r6, r0
    b .L_324
.L_2a0:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a644
    mov r6, r0
    b .L_324
.L_2b8:
    mov r0, r7
    bl func_0203c6a8
    mov r1, r9, lsl #0x10
    mov r2, r8
    mov r1, r1, lsr #0x10
    bl func_02039640
    mov r6, r0
    b .L_324
.L_2d8:
    mov r6, #0x1
    b .L_324
.L_2e0:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a730
    mov r6, r0
    b .L_324
.L_2f8:
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r8
    bl func_0203a6f4
    movs r6, r0
    beq .L_324
    ldrh r1, [r4, #0x4]
    mov r0, r5
    mov r2, r8
    bl func_0203a644
    mov r6, r0
.L_324:
    cmp r6, #0x0
    beq .L_348
    tst r8, #0x8000
    beq .L_348
    mov r0, r5
    mov r1, r8
    bl func_0203998c
    cmp r0, #0x0
    movle r6, #0x0
.L_348:
    cmp r6, #0x0
    mov r0, r5
    beq .L_364
    mov r1, r9
    mov r2, r8
    bl func_0203a100
    b .L_36c
.L_364:
    bl func_0203aa98
    mov r5, #0x0
.L_36c:
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1, #0x10]
    mov r0, r5
    str r2, [r1, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219c3a0
_LIT1: .word data_0219b234
