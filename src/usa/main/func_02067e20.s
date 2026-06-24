; func_02067e20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101c40
        .extern func_020552bc
        .extern func_0206830c
        .extern func_02068798
        .extern func_020aafd0
        .global func_02067e20
        .arm
func_02067e20:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r7, r2
    mov r5, r0
    ldr r1, _LIT0
    mov r0, r7
    bl func_020aafd0
    cmp r0, #0x0
    movne r6, #0x1
    moveq r6, #0x0
    mov r0, r4
    mov r1, r7
    bl func_02068798
    cmp r6, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrb r0, [r4, #0x14]
    ands r1, r0, #0x4
    orrne r0, r0, #0x41
    strneb r0, [r4, #0x14]
    orreq r0, r0, #0x42
    streqb r0, [r4, #0x14]
    ldrb r0, [r4, #0x14]
    and r0, r0, #0xf3
    strb r0, [r4, #0x14]
    bl func_020552bc
    ldr r2, [r4, #0x1c]
    mov r1, r4
    sub r0, r0, r2
    str r0, [r4, #0x1c]
    add r0, r5, #0x8
    bl func_0206830c
    ldr r3, [r5, #0x48]
    ldr ip, [r5, #0x44]
    mov r0, r5
    mov r2, r4
    mov r1, #0x0
    blx ip
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101c40
