
-- Every background is a table with the following structure:
-- {"background id", "file name"}
backgrounds = {
    {"yiyara","yiyara.jpg"},
    {"y","l2-1.jpg"},

    {"i1","intro-1.jpg"},
    {"i2","intro-2.jpg"},
    {"i3","intro-3.jpg"},
    {"i4","intro-4.jpg"},
    {"i5","intro-5.jpg"},
    {"i6","intro-6.jpg"},
    {"i7","intro-7.jpg"},
    {"i8","intro-8.jpg"},
    {"i9","intro-9.jpg"},
    {"i10","intro-10.jpg"},
    {"i11","intro-11.jpg"},
    {"i12","intro-12.jpg"},
    {"i13","intro-13.jpg"},
    {"i14","intro-14.jpg"},
    {"i15","intro-15.jpg"},
    {"i16","intro-16.jpg"},

    {"l2-1","l2-1.jpg"},
    {"l2-2","l2-2.jpg"},

    {"o1","outro-1.jpg"},
    {"o2","outro-2.jpg"},
    {"o3","outro-3.jpg"},
    {"o4","outro-4.jpg"},
    {"o5","outro-5.jpg"},
    {"o6","outro-6.jpg"},
    {"o7","outro-7.jpg"},
    {"o8","outro-8.jpg"},
    {"credits","credits.jpg"},

    {"y1","Yiyara sonriendo.png"},
    {"y2","Yiyara enojado.png"},
    {"y3","Yiyara austado.png"},
    {"y4","Yiyara sorprendido.png"},
    {"y5","Yiyara sonriendo ojos cerrados.png"},

    {"a1","Abuelo preocupado.png"},
    {"a2","Abuelo sonriendo.png"},

    {"c1","Chaman hablando feliz.png"},
    {"c2","Chaman hablando ojos abiertos.png"},
    {"c3","Chaman hablando ojos cerrados.png"}
}

-- Every paragraph is a table with the following structure:
-- {"background id", "texture id", "title", "text"}
levels = {
    {
        name = "Intro",
        description = "El nacimiento de una nueva voz",
        on_start = function()
            -- Aquí puedes definir qué hacer al empezar el nivel 0
            narrative_screen.current_music = track_02
            narrative_screen.current_music:setLooping(true)
            narrative_screen.current_music:play()
        end,
        paragraphs = {
            {"i1", "", "","Era una mañana especial"},
            {"i1", "", "", "El pequeño Juan cumplía 3 años y para el pueblo eso solo significaba una cosa" },
            {"i2", "", "", "¡Hoy era día del Lanta Tipina!" },
            {"i2", "", "", "Durante días, todo el pueblo preparó las calles para celebrar a lo grande el tan esperado ritual del nieto de don Tomás, el gran yachák: ver el nacimiento de una nueva voz y de un nuevo kumaka kamiria." },
            {"i3", "", "", "Mientras preparaban a Juanito, Yachák tuvo un repentino sentimiento de angustia e incertidumbre." },
            {"i4", "", "", "“Juanito, ¿estás bien?”, preguntó preocupado a su pequeño heredero, pero no obtuvo respuesta." },
            {"i4", "", "", "¡Eso era! Juan aún no podía hablar. ¿Cómo iba a ser bautizado hoy si no puede pronunciar palabra alguna? ¡Cómo pudo descuidarse tanto!" },
            {"i5", "", "", "Tuvo que contar lo ocurrido al pueblo y suspender la celebración. “Pueden aprovechar las viandas y la música para celebrar la vida, si lo desean”, comentó con vergüenza y pesar." },
            {"i6", "", "", "Inmediatamente después, acudió a una consulta extraordinaria con Manihuari, un sabio chamán y apreciado amigo del curaca\nTomás, el mutismo de Juan tiene solución, pero aún no es el momento de conocerla." },
            {"i7", "", "", "“Debemos esperar y pronto llegará el día en el que conozcamos la sabiduría de su voz”"},
            {"i8", "", "", "El río y todo el pueblo fueron testigos de ese gran día, una mañana cualquiera… 4 años después" },
            {"i8", "", "", "¡IYA!" },
            {"i9", "", "", "Dijo sonriendo el nieto del gran yachák y todos se quedaron sin habla por el asombro, mientras que un abuelo orgulloso corrió hacia el niño para estrecharlo hacia él con un fuerte abrazo." },
            {"i9", "", "", "De repente, una comparsa musical improvisada empezó a armarse, mientras todos iban a sus casas a buscar las tijeras para iniciar el ritual del Lanta Tipina, el cual daría la bienvenida a un nuevo miembro kukama-kamiria." },
            {"i10", "", "", "Antes de empezar, don Tomas decidió bautizar a su nieto con un nombre memorable, un nombre que refleje el nacimiento de su voz y su nuevo poder, un nombre que llene su espíritu de un orgullo cada vez que lo pronuncie:"},
            {"yiyara", "", "", "Yiyara, “fuerza del corazón”"}
        },
        on_finish = function()
            -- Aquí puedes definir qué hacer al finalizar el nivel 0
            narrative_screen.current_music:stop()
            goto_screen(menu_screen)
        end
    },
    {
        name = "Nivel 1",
        description = "El llamado del abuelo",
        on_start = function()
            -- Aquí puedes definir qué hacer al empezar el nivel 1
            narrative_screen.current_music:stop()
            narrative_screen.current_music = track_03
            narrative_screen.current_music:setLooping(true)
            narrative_screen.current_music:play()
        end,
        paragraphs = {
            {"y", "", "", "Una tarde, al regresar de la escuela, un joven Yiyara de 12 años encontró a su abuelo reposando en la cama. Él siempre tomaba “sueños reveladores” que luego compartía con su nieto y todos los pobladores, así que no lo despertó y empezó a imaginar con alegría qué historia nueva contaría esta noche."},
            {"y", "", "", "Pero la noche llegó y el sabio curaca no se levantaba ni se movía. Yiyara se acercó con cautela y notó que su cuerpo hervía en fiebre y sus respiraciones, lentas y forzadas. Además, un fuerte dolor tenía inmovilizado su cuerpo."},
            {"y", "", "", "El pánico se apoderó de Yiyara. Nunca había visto a su querido abuelo tan vulnerable."},
            {"y", "", "", "Apenas con un poco de fuerzas, el gran yachák abrió los ojos y le pidió a su joven nieto:\n\n“Yiyara, debes cruzar el río y buscar al chamán Manihuari. Cuéntale cómo estoy y él sabrá qué hacer.”"},
            {"y", "", "", "“¡No creas que este árbol va a quebrarse tan fácilmente! Es más fácil que una boa devore a un kunumi como tú a que yo sucumba je je je”"},
            {"y", "", "", "“Toma este amuleto, te protegerá en tu camino. Eres joven, inteligente y guardas todos los secretos de nuestro pueblo, pero no está de más darte protección extra.\n\n Ahora ve: el chamán te espera”"},
            {"y", "", "", "Con el corazón oprimido, Yiyara tomó el amuleto y se preparó para partir hacia el otro lado del río. Esta noche, tenía que salvar la vida de su abuelo, la única persona en el mundo que le dio sus dos grandes tesoros en la vida: el amor de un padre y el legado de toda una generación."},
            {"y", "", "", "Nada podía detenerlo. Ni el miedo, ni ese olor tan fétido que se desprendía de la casa de su abuelo…"},
            {"y", "", "", "“¿Y ese olor tan extraño?¿Y esa planta… nunca la habías visto antes?... ¡No es momento de preocuparse por esos detalles, Yiyara!”"}
        },
        on_finish = function()
            -- Aquí puedes definir qué hacer al finalizar el nivel 1
            narrative_screen.current_music:stop()
            narrative_screen.set_level(levels[3])
            goto_screen(narrative_screen)
        end
    },
    {
        name = "Nivel 2",
        description = "El viaje de Yiyara",
        on_start = function()
            -- Aquí puedes definir qué hacer al empezar el nivel 2
            narrative_screen.current_music:stop()
            narrative_screen.current_music = track_02
            narrative_screen.current_music:setLooping(true)
            narrative_screen.current_music:play()
        end,
        paragraphs = {
            {"l2-1", "", "", "Una vez fuera de su casa, con el amuleto al pecho, Yiyara se dirigió al río."},
            {"l2-2", "", "", "Montó la balsa y empezó a remar, cada palada aferrándose a la esperanza. A su alrededor flotaban troncos, peces muertos y bolsas de plástico. Este triste panorama le hizo recordar las palabras de su abuelo."},
            {"l2-2", "", "", "“Por años, la minería ilegal ha vertido mercurio en nuestras aguas. La basura asfixió el cauce y la codicia agotó nuestro río.”"},
            {"l2-2", "", "", "Con el corazón oprimido, Yiyara remó con más fuerza y, al llegar a la orilla, corrió hacia la casa del chamán. El amuleto latía en su mano como un pequeño corazón vivo."},
            {"y", "y1", "Yiyara", "Buenas noches, gran chamán. Vengo por encargo de mi abuelo. Está muy grave."},
            {"y", "c1", "Chamán Manihuara", "Lo sé. Tus sueños me lo anunciaron. ¿Traes el amuleto?"},
            {"y", "c1", "Chamán Manihuara", "Debes elegir el poder que protegerá tu espíritu. Es una decisión importante, pues estará contigo toda tu vida. ¿Cuál eliges?:"},
            {"y", "y1", "Yiyara", "¡Elijo oír a los espíritus, para entender los mensajes de los sabios kukama!"},
            {"y", "c1", "Chamán Manihuara", "Que así sea."},
            {"y", "", "Yatsi", "“Maniatipa”"},
            {"y", "c1", "Chamán Manihuara", "Ella es Yatsi, tu espíritu protector. Su poder protector te ayudará a purificar el alma del Payun y, con él, el espíritu de tu abuelo. ¡Debes hacerlo antes del amanecer!"},
            {"y", "y1", "Yiyara", "Así lo haré"},
            {"y", "c1", "Chamán Manihuara", "Sigue este sendero hacia la Ciudad de las Pesadillas Vivientes. Lo dejo en tus manos, Yiyara."}
        },
        on_finish = function()
            narrative_screen.set_level(levels[4])
            goto_screen(narrative_screen)
        end
    },
    {
        name = "Nivel 3",
        description = "Los mashakaras de la ciudad",
        on_start = function()
            -- Aquí puedes definir qué hacer al empezar el nivel 3
            narrative_screen.current_music:stop()
            narrative_screen.current_music = track_03
            narrative_screen.current_music:setLooping(true)
            narrative_screen.current_music:play()
        end,
        paragraphs = {
            {"y", "", "", "Yiyara y Yatsi fueron recibidos por una fiesta que iluminaba las calles de “Ciudad de las pesadillas vivientes”: todos los jóvenes, antes tan vinculados a la cultura kukama, lucían máscaras de animales familiares y otras espeluznantes."},
            {"y", "", "Yiyara", "¿Qué está pasando? ¿Acaso el Payun los ha hechizado?"},
            {"y", "", "Mashakara avergonzado", "¡Mocoso atrevido, por qué vistes así! ¡¡¡Eres una vergüenza!!!"},
            {"y", "", "Karuara nostálgico", "Antes, mujeres y niños corrían y cantaban aquí, recibiendo a los pescadores con sardinas y tukunarés frescos"},
            {"y", "", "Karuara nostálgico", "Cuando cocinaban paiche, toda la familia se reunía: padres, abuelos, nietos… compartir juntos daba un sabor especial a la comida"},
            {"y", "", "Yiyara", "¿Qué fue eso? Me dio escalofríos…"},
            {"y", "", "Mashakara escéptico", "¿Oyendo fantasmas? ¡Estamos en la ciudad! ¡Aquí no creemos ni en fantasmas ni en espíritus!"},
            {"y", "", "Karuara danzante", "Al caer la noche, las mashakaras solían danzar al ritmo de tambores, agradeciendo a la tierra y al río por sus dones"},
            {"y", "", "Karuara danzante", "Sus ritmos eran tan contagiosos que hasta los tunchis y los shabchicos se unían a la celebración y hacían travesuras."},
            {"y", "", "Mashakara atormentado", "¿Qué me miras? ¡Deja de mirarme! ¡¡Deja de juzgarme!! ¡¡¡Vas a pagar por esto!!!"},
            {"y", "", "Karuara nostálgico", "Desde que el Payun del pueblo se volvió poderoso, todos empezaron a usar esas máscaras de formas extrañas. Si alguien no quería ponérsela, se alejaban de esa persona y se burlaban de ella"},
            {"y", "", "Karuara nostálgico", "A mí me dieron una y la vendí para comprarme esas vasijas pequeñas con forma de pez que están de moda. ¡Pero sí que compré demasiadas! Así que quiero darte algunas, toma. ¡Espero que luzcan bien en tu casa!"}
        },
        on_finish = function()
            narrative_screen.set_level(levels[5])
            goto_screen(narrative_screen)
        end
    },
    {
        name = "Nivel 4",
        description = "El encuentro con Payun",
        on_start = function()
            -- Aquí puedes definir qué hacer al empezar el nivel 4
            narrative_screen.current_music:stop()
            narrative_screen.current_music = track_06
            narrative_screen.current_music:setLooping(true)
            narrative_screen.current_music:play()
        end,
        paragraphs = {
            {"y", "", "Payun", "Te estaba esperando, joven Yiyara… o ¿debo decir “Fuerza del Corazón”? Ahora veremos qué tan fuerte eres."},
            {"y", "", "Yiyara", "Payun, he venido a ayudarte."},
            {"y", "", "Payun", "¿A ayudarme? ¿Qué te hace pensar que necesito ayuda? ¡Por aquí todo está estupendo! Creo que te hace falta un cambio en tus pensamientos, jovencito…"},
            {"y", "", "Yiyara", "Veo que la única opción es enfrentarme a ti… (susurra) “Yuranai, Yuranai, Yuranai”"},
            {"y", "", "Payun", "Veo que vienes preparado. Yo también lo estuve… por eso tu abuelo enfermó ¿Reconoces ese olor de su casa? Es mi sello JA JA JA"},
            {"y", "", "Yiyara", "¡¡¡IYAAA!!!"},
            {"o1", "", "", "Después de una dura batalla, la máscara del Payun cayó al suelo. Él se desplomó, vencido por la fuerza del corazón de Yiyara."},
            {"o1", "", "", "La máscara había ocultado su verdadero sentir: también él había sido rechazado por ser kukama. Avergonzado, encontró en la voz de su vencedor una luz de esperanza que lo llamaba a redescubrir sus raíces."},
            {"o2", "", "Yiyara", "Toma mi máscara. Fue hecha con orgullo por el kukama más ejemplar que he conocido en mi vida. Estoy seguro que te dará el valor que necesitas para encontrar tu verdadera identidad."},
            {"o2", "", "", "De la oscuridad emergieron los pobladores. Un coro de cánticos kukama envolvió al Payun, sanando sus heridas."},
            {"o2", "", "Payun", "El Payun no pudo evitar pensar lo siguiente: “ya veo, esto significa sentirse libre…”"},
            {"o2", "", "Yiyara", "Cuando llegues al pueblo, te daremos un nuevo nombre, uno que refleje tu verdadero ser kukama."},
            {"o3", "", "", "Bajo sus pies, el Camino de los Recuerdos Rotos renació: lo que antes eran escombros se convirtió en un sendero vivo, símbolo del presente que juntos habían forjado."},
            {"o4", "", "", "Yiyara sonrió al ver la ciudad renacer con el espíritu kukama."},
            {"o4", "", "Payun", "¡Esto ayudará a tu abuelo!”, le dijo el renovado Payun mientras le lanzaba un frasco con una forma especial."},
            {"o4", "", "Yiyara", "¡Gracias, Payun!"},
            {"o4", "", "", "De regreso, los jóvenes bailaban y los niños portaban antorchas, llenando el sendero de esperanza."},
            {"o4", "", "Yiyara", "“Será la primera vez que cuente mis historias al abuelo… ¡Ojalá no piense que me las invento!”, pensaba ilusionado el joven kukama."},
            {"o5", "", "", "Remó de vuelta al pueblo y, al pasar por la casa del chamán, la encontró vacía: deseaba agradecer y preguntar por Yatsi."},
            {"o5", "", "Yiyara", "¡A mi abuelo le encantará conocerte, Yatsi!"},
            {"o6", "", "", "Con la cura en mano, contempló el amanecer en el agua."},
            {"o6", "", "", "Se inclinó al río para ver su rostro en el agua, pero su bondadoso y valiente corazón casi se detiene cuando vio lo que vio:"},
            {"o7", "", "", "Era el semblante de su abuelo convertido en un hombre del río: piel cobriza, cola de pez, resplandeciente y lleno de juventud. Llevaba una sonrisa llena de paz, una que nunca había visto."},
            {"o7", "", "", "Yiyara lo entendió todo: su abuelo se libró de la maldición y su espíritu por fin pudo llegar al mar, como siempre lo deseó."},
            {"o7", "", "Yiyara", "Abuelo, ¡te voy a extrañar! Gracias por enseñarme los saberes kukama. Ahora sé dónde encontrarte siempre."},
            {"o8", "", "", ""},
            {"credits", "", "", ""}
        },
        on_finish = function()
            -- Aquí puedes definir qué hacer al finalizar el nivel 4
            love.event.quit()
        end
    }
}