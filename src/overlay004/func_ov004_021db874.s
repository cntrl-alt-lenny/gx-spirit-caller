; func_ov004_021db874 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02200f18
        .global func_ov004_021db874
        .arm
func_ov004_021db874:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldrb r2, [r0]
    mov r7, #0x0
    mov lr, r7
    cmp r2, #0x0
    beq .L_104
    mov r9, #0xbc
    ldr r3, _LIT0
    ldr r8, _LIT1
    mov ip, r7
    mov r2, #0x3f
    mov sl, r9
.L_30:
    ldrb r5, [r0, lr]
    add r4, r0, lr
    cmp r5, #0x80
    bcs .L_50
    mov r4, r7, lsl #0x1
    strh r5, [r1, r4]
    add r7, r7, #0x1
    b .L_f4
.L_50:
    cmp r5, #0xa0
    bcc .L_7c
    cmp r5, #0xdf
    bhi .L_7c
    sub r4, r5, #0x40
    and r5, r4, #0xff
    mov r4, r7, lsl #0x1
    orr r5, r5, #0xff00
    strh r5, [r1, r4]
    add r7, r7, #0x1
    b .L_f4
.L_7c:
    cmp r5, #0xfc
    bhi .L_e8
    ldrb r4, [r4, #0x1]
    cmp r4, #0x40
    bcc .L_e8
    cmp r4, #0xfc
    bhi .L_e8
    cmp r5, #0xe0
    subge fp, r5, #0xc1
    mulge r5, fp, sl
    sublt fp, r5, #0x81
    mullt r5, fp, r9
    cmp r4, #0x80
    subge r4, r4, #0x41
    sublt r4, r4, #0x40
    add r5, r5, r4
    cmp r5, r8
    mov r6, ip
    movlt r4, r5, lsl #0x1
    ldrlth r6, [r3, r4]
    mov r4, r7, lsl #0x1
    add r7, r7, #0x1
    cmp r6, #0x0
    moveq r6, #0x3f
    strh r6, [r1, r4]
    add lr, lr, #0x1
    b .L_f4
.L_e8:
    mov r4, r7, lsl #0x1
    strh r2, [r1, r4]
    add r7, r7, #0x1
.L_f4:
    add lr, lr, #0x1
    ldrb r4, [r0, lr]
    cmp r4, #0x0
    bne .L_30
.L_104:
    mov r0, r7, lsl #0x1
    mov r2, #0x0
    strh r2, [r1, r0]
    add r0, r7, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_02200f18
_LIT1: .word 0x00002c10
