; func_ov006_021b7010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202df78
        .global func_ov006_021b7010
        .arm
func_ov006_021b7010:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r2
    mov r5, r3
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_124
    b .L_ec
    b .L_f8
    b .L_104
    b .L_110
    b .L_11c
.L_ec:
    add r2, r0, #0x2a0
    add r4, r2, #0x6000
    b .L_124
.L_f8:
    add r2, r0, #0xa60
    add r4, r2, #0x7000
    b .L_124
.L_104:
    add r2, r0, #0xc60
    add r4, r2, #0x7000
    b .L_124
.L_110:
    add r2, r0, #0xe60
    add r4, r2, #0x7000
    b .L_124
.L_11c:
    add r2, r0, #0x60
    add r4, r2, #0x8000
.L_124:
    add r0, r0, r1, lsl #0x1
    add r0, r0, #0x8100
    ldrh r8, [r0, #0x60]
    mov r9, #0x0
    mov sl, r9
    cmp r8, #0x0
    ble .L_1a4
    mov r7, r9
.L_144:
    ldrh r1, [r4]
    mov r0, r6
    bl func_0202df78
    cmp r0, #0x0
    beq .L_194
    cmp r5, #0x0
    beq .L_18c
    ldrb r0, [r4, #0x2]
    mov r2, r7
    cmp r0, #0x0
    ble .L_18c
    add r1, r5, r9, lsl #0x2
.L_174:
    ldrh r0, [r4]
    str r0, [r1, r2, lsl #0x2]
    ldrb r0, [r4, #0x2]
    add r2, r2, #0x1
    cmp r2, r0
    blt .L_174
.L_18c:
    ldrb r0, [r4, #0x2]
    add r9, r9, r0
.L_194:
    add sl, sl, #0x1
    cmp sl, r8
    add r4, r4, #0x4
    blt .L_144
.L_1a4:
    mov r0, r9
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
