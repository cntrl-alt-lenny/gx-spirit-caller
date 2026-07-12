; func_ov010_021b3da0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8c08
        .extern data_ov010_021b8c44
        .extern func_0208c79c
        .extern func_020b377c
        .extern func_ov010_021b6414
        .extern func_ov010_021b8414
        .global func_ov010_021b3da0
        .arm
func_ov010_021b3da0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0xa0]
    mov r5, #0x0
    subs r1, r1, #0x1000
    str r1, [r0, #0xa0]
    strmi r5, [r4, #0x64]
    ldr r0, [r4, #0x64]
    ldr r1, [r4, #0x68]
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x0
    bl func_020b377c
    mov r2, r0
    mvn r1, #0xf
    ldr r0, _LIT2
    sub r1, r1, r2
    bl func_0208c79c
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    bne .L_13c
    mov r2, #0x4000000
    ldr r1, [r2]
    add r0, r2, #0x6c
    bic r3, r1, #0x1f00
    mvn r1, #0xf
    str r3, [r2]
    bl func_0208c79c
    mov r5, #0x1
.L_13c:
    ldr r0, [r4]
    cmp r0, #0x1
    beq .L_158
    cmp r0, #0x2
    beq .L_160
    cmp r0, #0x3
    b .L_164
.L_158:
    bl func_ov010_021b6414
    b .L_164
.L_160:
    bl func_ov010_021b8414
.L_164:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov010_021b8c08
_LIT1: .word data_ov010_021b8c44
_LIT2: .word 0x0400006c
