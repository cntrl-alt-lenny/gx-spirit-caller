; func_ov016_021b8178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b9624
        .extern func_ov016_021b8234
        .extern func_ov016_021b8608
        .global func_ov016_021b8178
        .arm
func_ov016_021b8178:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r2, [r6, #0x1dc]
    mov r1, #0x54
    mul r4, r2, r1
    ldr r2, [r6, #0x1f0]
    ldr r5, _LIT0
    cmp r2, #0x0
    bne .L_ba0
    add r1, r6, #0x100
    ldrh r1, [r1, #0xd8]
    cmp r1, #0x0
    bne .L_b70
    ldr r0, [r6, #0x1e0]
    cmp r0, #0x50
    addlt r0, r0, #0x10
    strlt r0, [r6, #0x1e0]
    ldr r0, [r6, #0x1e8]
    cmp r0, #0x18
    addlt r0, r0, #0x10
    strlt r0, [r6, #0x1e8]
    b .L_bc8
.L_b70:
    ldr r1, [r6, #0x1e0]
    cmp r1, #0x0
    bge .L_bc8
    add r1, r5, r4
    bl func_ov016_021b8608
    mov r0, r6
    add r1, r5, r4
    bl func_ov016_021b8234
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xd8]
    b .L_bc8
.L_ba0:
    ldr r2, [r6, #0x1e0]
    sub r0, r1, #0xf4
    cmp r2, r0
    subgt r0, r2, #0x18
    strgt r0, [r6, #0x1e0]
    ldr r1, [r6, #0x1e8]
    mvn r0, #0xd7
    cmp r1, r0
    subgt r0, r1, #0x18
    strgt r0, [r6, #0x1e8]
.L_bc8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov016_021b9624
