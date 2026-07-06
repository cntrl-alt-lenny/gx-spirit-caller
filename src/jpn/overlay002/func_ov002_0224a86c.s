; func_ov002_0224a86c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202e1e0
        .extern func_ov002_021b3ef8
        .extern func_ov002_02253370
        .global func_ov002_0224a86c
        .arm
func_ov002_0224a86c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r2, sl, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    ldr r5, _LIT3
    add r9, r0, r1
    add r8, r9, #0x260
    mov r4, #0xd
    mov r6, #0xb
.L_21c:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_274
    ldr r2, [r8]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov ip, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r6
    mov r2, r5
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_274
    mov r0, sl
    mov r1, r4
    mov r2, r7
    bl func_ov002_02253370
.L_274:
    ldr r0, [r9, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x4
    bcc .L_21c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000012a1
