; func_ov006_021b79a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_0210596c
        .extern func_02012470
        .extern func_ov006_021b69d8
        .extern func_ov006_021b7a78
        .global func_ov006_021b79a0
        .arm
func_ov006_021b79a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0x0
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov006_021b69d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x3
    addls pc, pc, r5, lsl #0x2
    b .L_94
    b .L_40
    b .L_58
    b .L_74
    b .L_88
.L_40:
    add r0, r6, #0x248
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r6
    bl Copy32
    b .L_94
.L_58:
    add r0, r6, #0xb50
    add r0, r0, #0x3000
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r6
    bl Copy32
    b .L_94
.L_74:
    ldr r0, _LIT0
    mov r1, r6
    mov r2, #0x124
    bl Copy32
    b .L_94
.L_88:
    mov r0, r4
    mov r1, r6
    bl func_02012470
.L_94:
    mov r0, r6
    bl func_ov006_021b7a78
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0210596c
