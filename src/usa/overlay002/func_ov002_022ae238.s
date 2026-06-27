; func_ov002_022ae238 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022ae1a4
        .global func_ov002_022ae238
        .arm
func_ov002_022ae238:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, #0x0
    mov r5, r1
    mov r6, r0
    mov r1, r4
.L_14:
    add r2, r6, r1, lsl #0x2
    ldr r0, [r2, #0x4]
    cmp r5, r0
    bne .L_3c
    mov r0, r1, lsl #0xb
    mov r1, #0x0
    add r0, r0, #0x80
    str r1, [r2, #0x10]
    add r0, r0, #0x4000
    ldmia sp!, {r4, r5, r6, pc}
.L_3c:
    add r1, r1, #0x1
    cmp r1, #0x3
    blt .L_14
    mov r2, #0x0
.L_4c:
    add r1, r6, r2, lsl #0x2
    add r0, r6, r4, lsl #0x2
    ldr r1, [r1, #0x10]
    ldr r0, [r0, #0x10]
    cmp r1, r0
    movhi r4, r2
    add r2, r2, #0x1
    cmp r2, #0x3
    blt .L_4c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_022ae1a4
    add r2, r6, r4, lsl #0x2
    mov r0, r4, lsl #0xb
    add r0, r0, #0x80
    str r5, [r2, #0x4]
    mov r1, #0x0
    str r1, [r2, #0x10]
    add r0, r0, #0x4000
    ldmia sp!, {r4, r5, r6, pc}
