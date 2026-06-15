; func_02032ac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020327e4
        .extern func_020334cc
        .global func_02032ac4
        .arm
func_02032ac4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    mov r0, r4
    mov r5, r1
    bl func_020334cc
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xeb4]
    add r1, r4, #0x2b4
    orr r0, r0, #0x1000
    cmp r5, #0x0
    str r0, [r4, #0xeb4]
    ldrne r0, [r1, #0xc00]
    bicne r0, r0, #0x2000
    strne r0, [r1, #0xc00]
    bne .L_e4
    ldr r2, [r1, #0xc00]
    mov r0, r4
    orr r2, r2, #0x2000
    str r2, [r1, #0xc00]
    bl func_020327e4
.L_e4:
    ldr r1, [r4, #0xee8]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
