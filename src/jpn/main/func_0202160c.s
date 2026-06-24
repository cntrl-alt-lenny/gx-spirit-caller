; func_0202160c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202160c
        .arm
func_0202160c:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x14]
    mov ip, #0x0
    mov r3, ip
    cmp r4, #0x0
    ble .L_48
    add lr, r0, #0x18
.L_1c:
    ldr r0, [lr]
    cmp r0, r1
    bne .L_38
    cmp ip, r2
    ldreq r0, [lr, #0x4]
    ldmeqia sp!, {r4, pc}
    add ip, ip, #0x1
.L_38:
    add r3, r3, #0x1
    cmp r3, r4
    add lr, lr, #0xc
    blt .L_1c
.L_48:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
