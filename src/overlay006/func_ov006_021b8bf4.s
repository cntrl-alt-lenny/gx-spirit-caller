; func_ov006_021b8bf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020b4768
        .extern data_ov006_0225bee0
        .extern data_ov006_0225bee1
        .extern func_0202b0e0
        .extern func_0202b9b0
        .global func_ov006_021b8bf4
        .arm
func_ov006_021b8bf4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x5f0
    bl Fill32
    ldr r0, _LIT1
    mov r4, #0x1
    ldr r6, [r0]
    cmp r6, #0x1
    ble .L_f40
    ldr r5, _LIT2
.L_f24:
    mov r0, r4
    bl func_0202b0e0
    bl func_0202b9b0
    add r4, r4, #0x1
    cmp r4, r6
    strb r0, [r5], #0x1
    blt .L_f24
.L_f40:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0225bee0
_LIT1: .word data_020b4768
_LIT2: .word data_ov006_0225bee1
