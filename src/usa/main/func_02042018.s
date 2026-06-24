; func_02042018 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe904
        .extern data_020fe91c
        .extern func_020411f8
        .extern func_02041460
        .extern func_02041798
        .extern func_02094500
        .global func_02042018
        .arm
func_02042018:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r2, _LIT0
    mov r6, r0
    ldr r4, [r5, #0xc]
    mov r1, #0x0
    bl func_02094500
    ldr r1, _LIT1
    add r0, r6, #0x1000
    mvn r2, #0x0
    str r2, [r0, #0xa2c]
    mov lr, r5
    str r2, [r0, #0xa30]
    add ip, r6, r1
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2}
    stmia ip, {r0, r1, r2}
    ldr r0, _LIT2
    ldr r1, _LIT3
    blx r4
    add r1, r6, #0x1000
    str r0, [r1, #0x9c8]
    ldr r0, [r1, #0x9c8]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r1, #0x20]
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT4
    ldr r1, _LIT5
    blx r4
    add r2, r6, #0x1000
    str r0, [r2, #0x9cc]
    ldr r0, [r2, #0x9cc]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r2, #0x20]
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT6
    ldr r2, [r2, #0xc]
    mov r0, r6
    add r1, r6, r1
    bl func_02041460
    cmp r0, #0x0
    addeq r1, r6, #0x1000
    moveq r0, #0x1
    streq r0, [r1, #0x20]
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r5]
    mov r0, r6
    bl func_020411f8
    cmp r0, #0x0
    addeq r1, r6, #0x1000
    moveq r0, #0x1
    streq r0, [r1, #0x20]
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_02041798
    add r1, r6, #0x1000
    str r0, [r1, #0x20]
    ldr r0, [r1, #0x20]
    cmp r0, #0x0
    moveq r0, #0xff
    streqb r0, [r1]
    add r0, r6, #0x1000
    ldr r0, [r0, #0x20]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001c10
_LIT1: .word 0x00001004
_LIT2: .word data_020fe904
_LIT3: .word 0x00000b68
_LIT4: .word data_020fe91c
_LIT5: .word 0x000005ea
_LIT6: .word 0x00001a04
