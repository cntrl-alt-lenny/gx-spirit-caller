; func_02019ea4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018bc0
        .global func_02019ea4
        .arm
func_02019ea4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    mov r0, r4
    bl func_02018bc0
    ldr r0, [r0, #0x10]
    cmp r4, #0x35
    mov r1, r0, lsl #0x1c
    bgt .L_424
    cmp r4, #0x35
    bge .L_480
    cmp r4, #0x1c
    bgt .L_408
    cmp r4, #0x19
    blt .L_3fc
    cmpne r4, #0x1b
    cmpne r4, #0x1c
    beq .L_480
    b .L_498
.L_3fc:
    cmp r4, #0x5
    beq .L_48c
    b .L_498
.L_408:
    cmp r4, #0x29
    bgt .L_418
    beq .L_480
    b .L_498
.L_418:
    cmp r4, #0x31
    beq .L_48c
    b .L_498
.L_424:
    cmp r4, #0x48
    bgt .L_468
    bge .L_480
    sub r0, r4, #0x36
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_498
    b .L_480
    b .L_498
    b .L_480
    b .L_480
    b .L_480
    b .L_498
    b .L_498
    b .L_498
    b .L_480
    b .L_480
.L_468:
    cmp r4, #0x4b
    bgt .L_478
    beq .L_48c
    b .L_498
.L_478:
    cmp r4, #0x5e
    bne .L_498
.L_480:
    mvn r0, r1, lsr #0x1e
    and r0, r0, #0x1
    ldmia sp!, {r4, pc}
.L_48c:
    mvn r0, r1, lsr #0x1e
    and r0, r0, #0x3
    ldmia sp!, {r4, pc}
.L_498:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
