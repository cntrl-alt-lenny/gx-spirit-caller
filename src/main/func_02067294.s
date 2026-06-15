; func_02067294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a7368
        .extern func_020aaddc
        .global func_02067294
        .arm
func_02067294:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r4, r0
    mov r0, r6
    bl func_020aaddc
    ldr r3, [r4, #0x800]
    add r5, r0, #0x1
    rsb r0, r3, #0x800
    cmp r5, r0
    movgt r5, r0
    cmp r5, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r6
    mov r2, r5
    add r0, r4, r3
    bl func_020a7368
    ldr r0, [r4, #0x800]
    mov r1, #0x0
    add r0, r0, r5
    str r0, [r4, #0x800]
    ldr r0, [r4, #0x800]
    sub r0, r0, #0x1
    strb r1, [r4, r0]
    ldmia sp!, {r4, r5, r6, pc}
