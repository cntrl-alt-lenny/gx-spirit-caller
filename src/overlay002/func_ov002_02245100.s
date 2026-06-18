; func_ov002_02245100 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021b1570
        .global func_ov002_02245100
        .arm
func_ov002_02245100:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc4
    ldr r1, _LIT0
    ldr r1, [r1, #0xd0c]
    cmp r1, #0x0
    addeq sp, sp, #0xc4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr lr, _LIT1
    mov r3, #0x0
    ldr r4, [lr, #0x5d4]
    add ip, r3, #0x1
    strh r4, [sp]
    cmp r4, #0x0
    bls .L_1a0
    mov r1, lr
    add r2, sp, #0x0
.L_15c:
    ldrb r9, [lr, #0x5dc]
    add r7, r1, r3, lsl #0x2
    mov r8, ip, lsl #0x1
    add r6, ip, #0x1
    add r5, ip, #0x2
    ldr r7, [r7, #0x5fc]
    add r3, r3, #0x1
    strh r9, [r2, r8]
    mov r6, r6, lsl #0x1
    strh r7, [r2, r6]
    mov r6, r7, lsr #0x10
    mov r5, r5, lsl #0x1
    strh r6, [r2, r5]
    cmp r3, r4
    add ip, ip, #0x3
    add lr, lr, #0x1
    bcc .L_15c
.L_1a0:
    cmp r0, #0x0
    movne r0, #0xc
    moveq r0, #0xb
    mov r0, r0, lsl #0x10
    add r2, sp, #0x0
    mov r0, r0, lsr #0x10
    mov r3, ip, lsl #0x1
    mvn r1, #0x0
    bl func_ov002_021b1570
    add sp, sp, #0xc4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022ce288
