; func_02032944 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02052be4
        .global func_02032944
        .arm
func_02032944:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    add r2, r4, #0x1f4
    ldr r3, [r2, #0xc80]
    mov r5, r1
    mov r1, #0xc
    mla r1, r5, r1, r3
    mov r6, r0
    add r0, r2, #0xc40
    bl func_02052be4
    ldr r2, [r4, #0xec8]
    cmp r2, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    blx r2
    ldmia sp!, {r4, r5, r6, pc}
