; func_02078dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078dcc
        .arm
func_02078dcc:
    stmdb sp!, {r4, r5, r6, lr}
    cmp r2, #0x0
    add r3, r0, #0x2
    ldrb lr, [r0]
    ldrb ip, [r0, #0x1]
    mov r4, #0x0
    ble .L_808
.L_7c4:
    add r5, lr, #0x1
    and lr, r5, #0xff
    ldrb r6, [r3, lr]
    add r5, ip, r6
    and ip, r5, #0xff
    ldrb r5, [r3, ip]
    strb r5, [r3, lr]
    add r5, r6, r5
    strb r6, [r3, ip]
    and r5, r5, #0xff
    ldrb r6, [r1, r4]
    ldrb r5, [r3, r5]
    eor r5, r6, r5
    strb r5, [r1, r4]
    add r4, r4, #0x1
    cmp r4, r2
    blt .L_7c4
.L_808:
    strb lr, [r0]
    strb ip, [r0, #0x1]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
