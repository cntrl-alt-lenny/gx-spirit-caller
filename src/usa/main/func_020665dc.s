; func_020665dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bed78
        .global func_020665dc
        .arm
func_020665dc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr ip, _LIT0
    mov r3, r0
    ldrb r7, [ip]
    ldrb r6, [ip, #0x1]
    ldrb r5, [ip, #0x2]
    ldrb r4, [ip, #0x3]
    ldrb lr, [ip, #0x4]
    ldrb r0, [ip, #0x5]
    strb r5, [sp, #0x2]
    strb r4, [sp, #0x3]
    strb r7, [sp]
    strb r6, [sp, #0x1]
    strb lr, [sp, #0x4]
    strb r0, [sp, #0x5]
    cmp r2, #0xa
    add r4, sp, #0x0
    mov r5, #0x1
    blt .L_7c
    mov r6, #0x0
.L_54:
    ldrb ip, [r4]
    ldrb r0, [r1, r6]
    cmp ip, r0
    movne r5, #0x0
    bne .L_80
    add r6, r6, #0x1
    cmp r6, #0x6
    add r4, r4, #0x1
    blt .L_54
    b .L_80
.L_7c:
    mov r5, #0x0
.L_80:
    cmp r5, #0x0
    beq .L_100
    add r2, r1, #0x6
    ldrb r1, [r1, #0x6]
    ldrb r0, [r2, #0x1]
    add ip, sp, #0x8
    strb r1, [ip]
    strb r0, [ip, #0x1]
    ldrb r1, [r2, #0x2]
    ldrb r0, [r2, #0x3]
    strb r1, [ip, #0x2]
    strb r0, [ip, #0x3]
    ldr r2, [r3, #0xa0]
    cmp r2, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr lr, [sp, #0x8]
    ldr r1, [r3, #0x10c]
    mov r3, lr, lsr #0x18
    mov r0, lr, lsr #0x8
    mov ip, lr, lsl #0x8
    and r3, r3, #0xff
    and r0, r0, #0xff00
    mov lr, lr, lsl #0x18
    orr r0, r3, r0
    and ip, ip, #0xff0000
    and r3, lr, #-16777216
    orr r0, ip, r0
    orr r0, r3, r0
    blx r2
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_100:
    ldr ip, [r3, #0xa4]
    cmp ip, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, r1
    mov r1, r2
    ldr r2, [r3, #0x10c]
    blx ip
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020bed78
