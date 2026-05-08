allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

subprojects {
    plugins.withId("com.android.library") {
        val android = extensions.getByName("android") as com.android.build.gradle.BaseExtension
        if (android.namespace == null) {
            // Fix for plugins missing namespace in newer AGP versions
            if (project.name == "image_gallery_saver") {
                android.namespace = "com.example.imagegallerysaver"
            } else {
                // Fallback for other plugins that might have this issue
                android.namespace = "com.${project.name.replace("-", ".").replace("_", ".")}"
            }
        }

        tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
        tasks.withType<JavaCompile>().configureEach {
            sourceCompatibility = JavaVersion.VERSION_1_8.toString()
            targetCompatibility = JavaVersion.VERSION_1_8.toString()
        }
    }

    plugins.withId("com.android.application") {
        val android = extensions.getByName("android") as com.android.build.gradle.BaseExtension
        if (android.namespace == null) {
            // Fix for plugins missing namespace in newer AGP versions
            if (project.name == "image_gallery_saver") {
                android.namespace = "com.example.imagegallerysaver"
            } else {
                // Fallback for other plugins that might have this issue
                android.namespace = "com.${project.name.replace("-", ".").replace("_", ".")}"
            }
        }

        tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
        tasks.withType<JavaCompile>().configureEach {
            sourceCompatibility = JavaVersion.VERSION_1_8.toString()
            targetCompatibility = JavaVersion.VERSION_1_8.toString()
        }
    }
}


