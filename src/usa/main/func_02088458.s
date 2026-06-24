; func_02088458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02087314
        .global func_02088458
        .arm
func_02088458:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r4, #0x0
    mov r6, r0
    mov ip, r4
    cmp r5, #0x0
    ble .L_40
    mov r1, #0x1
.L_20:
    ldrb r3, [r2, ip]
    add r0, r6, ip
    strb r3, [r0, #0x4c]
    ldrb r0, [r2, ip]
    add ip, ip, #0x1
    cmp ip, r5
    orr r4, r4, r1, lsl r0
    blt .L_20
.L_40:
    mov r0, r4
    bl func_02087314
    cmp r0, #0x0
    moveq r0, #0x0
    strne r5, [r6, #0x48]
    strne r4, [r6, #0x44]
    movne r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
