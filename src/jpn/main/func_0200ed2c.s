; func_0200ed2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02186a08
        .global func_0200ed2c
        .arm
func_0200ed2c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r3, [r0, #0xc]
    cmp r3, #0x0
    ble .L_fe8
    ldr ip, [r0, #0x14]
    mov r2, ip
.L_fa4:
    ldr r0, [r2, #0x60]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_fd8
    mov r2, #0x284
    mul r4, r1, r2
    add r1, ip, r4
    mov r0, #0x0
    bl Fill32
    ldr r0, _LIT0
    ldr r0, [r0, #0x14]
    add r0, r0, r4
    ldmia sp!, {r4, pc}
.L_fd8:
    add r1, r1, #0x1
    cmp r1, r3
    add r2, r2, #0x284
    blt .L_fa4
.L_fe8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02186a08
