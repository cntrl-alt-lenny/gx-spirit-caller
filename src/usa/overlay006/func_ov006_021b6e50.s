; func_ov006_021b6e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005994
        .extern func_ov006_021b8f00
        .global func_ov006_021b6e50
        .arm
func_ov006_021b6e50:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r3, #0x0
    str r3, [sp, #0x4]
    strh r2, [sp, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_6c
    b .L_34
    b .L_40
    b .L_4c
    b .L_58
    b .L_64
.L_34:
    add r2, r0, #0x2a0
    add r4, r2, #0x6000
    b .L_6c
.L_40:
    add r2, r0, #0xa60
    add r4, r2, #0x7000
    b .L_6c
.L_4c:
    add r2, r0, #0xc60
    add r4, r2, #0x7000
    b .L_6c
.L_58:
    add r2, r0, #0xe60
    add r4, r2, #0x7000
    b .L_6c
.L_64:
    add r2, r0, #0x60
    add r4, r2, #0x8000
.L_6c:
    add r0, r0, r1, lsl #0x1
    add r0, r0, #0x8100
    ldrh r5, [r0, #0x60]
    mov r0, #0x0
    cmp r5, #0x0
    ble .L_a4
    mov r2, r5, lsl #0x10
    ldr ip, _LIT0
    add r0, sp, #0x4
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    str ip, [sp]
    bl func_02005994
.L_a4:
    cmp r0, r5
    movge r0, #0x0
    addlt r0, r4, r0, lsl #0x2
    ldrltb r0, [r0, #0x2]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_ov006_021b8f00
