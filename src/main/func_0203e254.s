; func_0203e254 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0203c900
        .extern func_0203deac
        .extern func_0203def0
        .extern func_0203e0a0
        .extern func_0203e198
        .global func_0203e254
        .arm
func_0203e254:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r0, #0x10
    bl func_0203c900
    mov r4, r0
    cmp r5, #0x0
    beq .L_3dc
    cmp r5, #0x1
    beq .L_3fc
    cmp r5, #0x2
    beq .L_414
    b .L_438
.L_3dc:
    add r1, r4, #0x300
    mov r0, #0x0
    mov r2, #0x144
    bl Fill32
    mov r0, r4
    bl func_0203e198
    strb r0, [r4, #0xd10]
    b .L_438
.L_3fc:
    bl func_0203def0
    strb r0, [r4, #0xd10]
    mov r0, r4
    bl func_0203deac
    strb r0, [r4, #0xd0f]
    b .L_438
.L_414:
    add r1, r4, #0x300
    mov r0, #0x0
    mov r2, #0x144
    bl Fill32
    mov r1, #0x0
    mov r0, r4
    strb r1, [r4, #0xd0f]
    bl func_0203e0a0
    strb r0, [r4, #0xd10]
.L_438:
    ldrb r0, [r4, #0xd10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
