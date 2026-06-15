; func_0203eca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c814
        .extern func_0203ed80
        .extern func_0206ea90
        .global func_0203eca4
        .arm
func_0203eca4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrb r0, [r4, #0xd0d]
    cmp r0, #0x6
    addcs sp, sp, #0x8
    ldmcsia sp!, {r4, pc}
    bl func_0203c814
    add r4, r4, r0, lsl #0x8
    ldrb r0, [r4, #0xc0]
    ldrb r2, [r4, #0xc8]
    ldrb r1, [r4, #0xc9]
    cmp r0, #0x0
    ldrb r3, [r4, #0xca]
    add r1, r2, r1
    ldrb r2, [r4, #0xcb]
    add r1, r3, r1
    addne sp, sp, #0x8
    add r0, r2, r1
    ldmneia sp!, {r4, pc}
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0xc8
    bl func_0203ed80
    str r0, [sp]
    add r0, r4, #0xcc
    bl func_0203ed80
    str r0, [sp, #0x4]
    add r0, sp, #0x0
    add r1, sp, #0x4
    bl func_0206ea90
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
