; func_020510f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_02067368
        .extern func_02067594
        .global func_020510f4
        .arm
func_020510f4:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    bl func_02067594
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_fdc
    cmp r0, #0x1
    beq .L_fdc
    cmp r0, #0x2
    beq .L_1030
    ldmia sp!, {r4, pc}
.L_fdc:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_1020
    b .L_1020
    b .L_1020
    b .L_1020
    ldmia sp!, {r4, pc}
    b .L_1020
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_1020
.L_1020:
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
    ldmia sp!, {r4, pc}
.L_1030:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    ldmneia sp!, {r4, pc}
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
    ldmia sp!, {r4, pc}
