; func_ov002_022bd1fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037208
        .global func_ov002_022bd1fc
        .arm
func_ov002_022bd1fc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_2440
    cmp r0, #0x1
    beq .L_2474
    cmp r0, #0x2
    beq .L_24b4
    b .L_24cc
.L_2440:
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0xc58]
    mov r1, #0x0
    str r0, [r4, #0xce0]
    str r1, [r4, #0xcdc]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_24cc
.L_2474:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x8
    rsbgt r0, r0, #0x10
    mov r1, r0, lsl #0x8
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    str r0, [r4, #0xcdc]
    ldr r0, [r4, #0xc64]
    cmp r0, #0x10
    blt .L_24cc
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_24cc
.L_24b4:
    mov r0, #0x0
    str r0, [r4, #0xcdc]
    mov r1, #0xc
    str r1, [r4, #0xcc8]
    str r0, [r4, #0xc54]
    ldmia sp!, {r4, pc}
.L_24cc:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r4, pc}
