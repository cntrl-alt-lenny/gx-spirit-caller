; func_020491ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02049120
        .extern func_020557b8
        .global func_020491ec
        .arm
func_020491ec:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x210
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [r2]
    mov r5, r1
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    addeq sp, sp, #0x210
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5]
    bl func_02049120
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    addeq sp, sp, #0x210
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r5, #0x8]
    add r2, sp, #0x0
    mov r0, r6
    bl func_020557b8
    ldr r0, _LIT0
    ldr r1, [sp, #0x4]
    ldr r0, [r0]
    add r2, sp, #0x108
    ldr r3, [r0, #0x38]
    ldr ip, [r0, #0x34]
    mov r0, r4
    and r1, r1, #0xff
    blx ip
    add sp, sp, #0x210
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dc80
