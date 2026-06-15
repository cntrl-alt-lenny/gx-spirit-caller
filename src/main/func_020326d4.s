; func_020326d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032e38
        .extern func_020945f4
        .global func_020326d4
        .arm
func_020326d4:
    stmdb sp!, {r3, r4, r5, lr}
    add r4, r0, #0x1fc
    ldr r2, [r4, #0xc80]
    cmp r2, #0x0
    mvnne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r2, #0xc
    mul r5, r1, r2
    mov r1, r5
    mov r2, #0x4
    bl func_02032e38
    str r0, [r4, #0xc80]
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r2, r5
    mov r1, #0x0
    bl func_020945f4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
