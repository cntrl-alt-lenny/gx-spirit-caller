; func_02003b18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .extern func_02002200
        .extern func_020038c0
        .global func_02003b18
        .arm
func_02003b18:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    mov r7, r0
    ldr r0, [r4]
    mov r6, r2
    mov r5, r3
    cmp r0, #0x0
    ldr r4, [sp, #0x24]
    mov r3, #0x0
    bne .L_34
    cmp r1, #0x80
    bge .L_110
.L_34:
    sub r0, r4, #0x8
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_dc
    b .L_68
    b .L_dc
    b .L_80
    b .L_dc
    b .L_98
    b .L_dc
    b .L_b0
    b .L_dc
    b .L_c8
.L_68:
    ldr r0, _LIT0
    mov r2, #0x20
    ldr r0, [r0, #0x88]
    mov ip, #0x4
    add r3, r0, #0x80
    b .L_dc
.L_80:
    ldr r0, _LIT0
    mov r2, #0x32
    ldr r0, [r0, #0x90]
    mov ip, #0x5
    add r3, r0, #0x80
    b .L_dc
.L_98:
    ldr r0, _LIT0
    mov r2, #0x48
    ldr r0, [r0, #0x98]
    mov ip, #0x6
    add r3, r0, #0x80
    b .L_dc
.L_b0:
    ldr r0, _LIT0
    mov r2, #0x62
    ldr r0, [r0, #0xa0]
    mov ip, #0x7
    add r3, r0, #0x80
    b .L_dc
.L_c8:
    ldr r0, _LIT0
    mov r2, #0x80
    ldr r0, [r0, #0xa8]
    mov ip, #0x8
    add r3, r0, #0x80
.L_dc:
    cmp r3, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mla r0, r2, r1, r3
    ldr r1, [r7]
    ldr r2, [sp, #0x20]
    str r1, [sp]
    mov r1, r5
    mov r3, r4
    stmib sp, {r6, ip}
    bl func_02002200
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_110:
    mov r0, r1
    mov r1, r4
    bl func_020038c0
    ldr r1, [r7]
    add r7, r4, r4, lsr #0x1f
    str r1, [sp]
    ldr r2, [sp, #0x20]
    mov r1, r5
    mov r3, r4
    str r6, [sp, #0x4]
    mov r4, r7, asr #0x1
    str r4, [sp, #0x8]
    bl func_02002200
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02102c7c
