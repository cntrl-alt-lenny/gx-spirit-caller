; func_02003d78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02002898
        .global func_02003d78
        .arm
func_02003d78:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r4, [sp, #0x24]
    mov r5, #0x0
    sub r4, r4, #0x8
    cmp r4, #0x8
    addls pc, pc, r4, lsl #0x2
    b .L_338
    b .L_2c4
    b .L_338
    b .L_2dc
    b .L_338
    b .L_2f4
    b .L_338
    b .L_30c
    b .L_338
    b .L_324
.L_2c4:
    ldr r4, _LIT0
    mov ip, #0x20
    ldr r4, [r4, #0x88]
    mov lr, #0x4
    add r5, r4, #0x80
    b .L_338
.L_2dc:
    ldr r4, _LIT0
    mov ip, #0x32
    ldr r4, [r4, #0x90]
    mov lr, #0x5
    add r5, r4, #0x80
    b .L_338
.L_2f4:
    ldr r4, _LIT0
    mov ip, #0x48
    ldr r4, [r4, #0x98]
    mov lr, #0x6
    add r5, r4, #0x80
    b .L_338
.L_30c:
    ldr r4, _LIT0
    mov ip, #0x62
    ldr r4, [r4, #0xa0]
    mov lr, #0x7
    add r5, r4, #0x80
    b .L_338
.L_324:
    ldr r4, _LIT0
    mov ip, #0x80
    ldr r4, [r4, #0xa8]
    mov lr, #0x8
    add r5, r4, #0x80
.L_338:
    cmp r5, #0x0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r4, _LIT0
    ldr r4, [r4, #0x8]
    str r4, [sp]
    ldr r4, [r0]
    mla r0, ip, r1, r5
    str r4, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r1, r3
    ldr r2, [sp, #0x20]
    ldr r3, [sp, #0x24]
    str lr, [sp, #0xc]
    bl func_02002898
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02102b9c
