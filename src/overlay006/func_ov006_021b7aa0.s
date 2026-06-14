; func_ov006_021b7aa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_02105a4c
        .extern func_020124a4
        .extern func_ov006_021b6ad8
        .extern func_ov006_021b7b78
        .global func_ov006_021b7aa0
        .arm
func_ov006_021b7aa0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0x0
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov006_021b6ad8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x3
    addls pc, pc, r5, lsl #0x2
    b .L_be4
    b .L_b90
    b .L_ba8
    b .L_bc4
    b .L_bd8
.L_b90:
    add r0, r6, #0x248
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r6
    bl Copy32
    b .L_be4
.L_ba8:
    add r0, r6, #0xb50
    add r0, r0, #0x3000
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r6
    bl Copy32
    b .L_be4
.L_bc4:
    ldr r0, _LIT0
    mov r1, r6
    mov r2, #0x124
    bl Copy32
    b .L_be4
.L_bd8:
    mov r0, r4
    mov r1, r6
    bl func_020124a4
.L_be4:
    mov r0, r6
    bl func_ov006_021b7b78
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02105a4c
