; func_02029b6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201e7ec
        .extern func_0201e800
        .global func_02029b6c
        .arm
func_02029b6c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r6, r1
    movs r4, r3
    mov r5, r2
    add r8, sl, #0x98
    ldr r1, [sp, #0x28]
    bpl .L_52c
    ldrb r0, [sl, #0x79]
    mov r9, #0x0
    cmp r0, #0x0
    ble .L_55c
    mov r0, r1, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r2, r5, lsl #0x10
    mov r6, r0, lsr #0x10
    mov r5, r1, lsr #0x10
    mov r4, r2, lsr #0x10
    mov fp, #0x1
.L_4ec:
    add r0, r8, r9, lsl #0x2
    ldr r7, [r0, #0x8]
    mov r1, r6
    mov r0, r7
    bl func_0201e800
    mov r0, r7
    mov r1, fp
    bl func_0201e7ec
    add r0, r8, r9, lsl #0x1
    strh r5, [r0, #0x70]
    strh r4, [r0, #0xa0]
    ldrb r0, [sl, #0x79]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_4ec
    b .L_55c
.L_52c:
    add r0, r8, r4, lsl #0x2
    ldr r7, [r0, #0x8]
    mov r1, r1, lsl #0x10
    mov r0, r7
    mov r1, r1, lsr #0x10
    bl func_0201e800
    mov r0, r7
    mov r1, #0x1
    bl func_0201e7ec
    add r0, r8, r4, lsl #0x1
    strh r6, [r0, #0x70]
    strh r5, [r0, #0xa0]
.L_55c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
