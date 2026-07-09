; func_ov002_0227b084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bad9c
        .extern func_ov002_021bbe70
        .extern func_ov002_021bd228
        .extern func_ov002_021c398c
        .extern func_ov002_02259e8c
        .extern func_ov002_0227afc8
        .extern func_ov002_02280a64
        .extern func_ov002_0228119c
        .global func_ov002_0227b084
        .arm
func_ov002_0227b084:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    rsb r5, sl, #0x1
    mov r9, r1
    mov r8, r2
    mov r0, r5
    mvn r1, #0x0
    mov r2, #0x0
    bl func_ov002_0227afc8
    mov r1, #0x0
    mov r6, r0
    mov r0, sl
    str r1, [sp]
    sub r2, r1, #0x1
    mov r1, sl
    mov r3, #0x1
    bl func_ov002_02280a64
    mov r7, r0
    mov r0, #0x1
    str r0, [sp]
    sub r2, r0, #0x2
    mov r0, sl
    mov r1, sl
    mov r3, #0x0
    bl func_ov002_02280a64
    str r0, [sp, #0x4]
    mov r0, r5
    mov r4, #0x64
    bl func_ov002_021bbe70
    cmp r0, #0x0
    bne .L_c8
    mov r0, sl
    mov r1, sl
    bl func_ov002_0228119c
    ldr r1, _LIT0
    and r2, r5, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    ldr r1, [r1, r3]
    cmp r1, r0
    bgt .L_c8
    mov r0, sl
    bl func_ov002_02259e8c
    cmp r0, #0x0
    beq .L_c8
    cmp r9, #0x0
    addgt sp, sp, #0x8
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c8:
    cmp r9, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    cmp r6, r0
    movle r6, r0
    sub fp, r6, r9
    cmp fp, #0x3e8
    addge sp, sp, #0x8
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    bl func_ov002_021bd228
    cmp r0, #0x0
    beq .L_13c
    mov r0, sl
    mov r1, #0x16
    bl func_ov002_021c398c
    cmp r0, #0x0
    movne r4, #0x12c
.L_13c:
    ldr r1, _LIT4
    mov r0, r5
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r4, #0x0
    cmp r9, r8
    blt .L_18c
    cmp fp, r4
    bgt .L_1cc
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    cmp r0, r4
    ble .L_1cc
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18c:
    cmp r9, r6
    ldrge r0, _LIT5
    cmpge r9, r0
    addge sp, sp, #0x8
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x4]
    cmp r7, r0
    movle r7, r0
    cmp r8, r7
    blt .L_1cc
    ldr r0, _LIT3
    cmp r8, r0
    addgt sp, sp, #0x8
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1cc:
    cmp r9, r6
    addge sp, sp, #0x8
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp fp, r4
    movgt r0, #0x1
    mvnle r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000013f9
_LIT3: .word 0x000005dc
_LIT4: .word 0x0000130c
_LIT5: .word 0x000006a4
