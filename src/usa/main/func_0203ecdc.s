; func_0203ecdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203ecdc
        .arm
func_0203ecdc:
    rsb r0, r0, #0x20
    cmp r0, #0x0
    mvn r3, #0x0
    mov r1, #0x0
    ble .L_208
.L_1f8:
    add r1, r1, #0x1
    cmp r1, r0
    mov r3, r3, lsl #0x1
    blt .L_1f8
.L_208:
    mov r1, r3, lsr #0x18
    mov r0, r3, lsr #0x8
    mov r2, r3, lsl #0x8
    mov r3, r3, lsl #0x18
    and r1, r1, #0xff
    and r0, r0, #0xff00
    and r2, r2, #0xff0000
    orr r0, r1, r0
    and r1, r3, #-16777216
    orr r0, r2, r0
    orr r0, r1, r0
    bx lr
