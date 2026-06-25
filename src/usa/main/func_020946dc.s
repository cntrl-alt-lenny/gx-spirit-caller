; func_020946dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020946dc
        .arm
func_020946dc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, [r0], #0x4
    mov r2, r5, lsr #0x8
.L_c:
    cmp r2, #0x0
    ble .L_8c
    ldrb lr, [r0], #0x1
    mov r4, #0x8
.L_1c:
    subs r4, r4, #0x1
    blt .L_c
    tst lr, #0x80
    bne .L_40
    ldrb r6, [r0], #0x1
    swpb r6, r6, [r1]
    add r1, r1, #0x1
    sub r2, r2, #0x1
    b .L_7c
.L_40:
    ldrb r5, [r0]
    mov r6, #0x3
    add r3, r6, r5, asr #0x4
    ldrb r6, [r0], #0x1
    and r5, r6, #0xf
    mov ip, r5, lsl #0x8
    ldrb r6, [r0], #0x1
    orr r5, r6, ip
    add ip, r5, #0x1
    sub r2, r2, r3
.L_68:
    ldrb r5, [r1, -ip]
    swpb r5, r5, [r1]
    add r1, r1, #0x1
    subs r3, r3, #0x1
    bgt .L_68
.L_7c:
    cmp r2, #0x0
    movgt lr, lr, lsl #0x1
    bgt .L_1c
    b .L_c
.L_8c:
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
