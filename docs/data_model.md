# Data Model

## Entity Definitions

1. **User**
   - **Attributes**:
     - `id` (Primary Key): Unique identifier for the user.
     - `full_name`: Full Name of the user.
     - `email`: Email address of the user.
     - `birth_date`: Birth Date of the user.
     - `gender`: Gender of the user (Male | Female).
     - `password_hash`: Hashed password for security.
     - `created_at`: Timestamp of when the user was created.
     - `updated_at`: Timestamp of the last update to the user's information.
   - **Relationships**:
     - Belongs to: None
     - Has one: FitnessProfile

2. **FitnessProfile**
   - **Attributes**:
     - `id` (Primary Key): Unique identifier for the fitness profile.
     - `user_id` (Foreign Key): References the User entity.
     - `age`: Age of the user.
     - `height`: Height of the user in meters.
     - `weight`: Weight of the user in kilograms.
     - `body_somatotype`: Body Somatotype of the user (mesomorph, ectomorph, endomorph).
     - `created_at`: Timestamp of when the fitness profile was created.
     - `updated_at`: Timestamp of the last update to the fitness profile's information.
   - **Relationships**:
     - Belongs to: User
     - Has many: TrainingProgram, ProgramWeek, WorkoutDay, Workout & WorkoutLog

3. **TrainingProgram**
   - **Attributes**:
     - `id` (Primary Key): Unique identifier for the training program.
     - `fitness_profile_id` (Foreign Key): References the FitnessProfile entity.
     - `name`: Name of the training program.
     - `description`: Description of the training program.
     - `created_at`: Timestamp of when the training program was created.
     - `updated_at`: Timestamp of the last update to the training program's information.
   - **Relationships**:
     - Belongs to: FitnessProfile
     - Has many: ProgramWeek

4. **ProgramWeek**
   - **Attributes**:
     - `id` (Primary Key): Unique identifier for the program week.
     - `training_program_id` (Foreign Key): References the TrainingProgram entity.
     - `week_number`: Number of the week in the training program.
     - `created_at`: Timestamp of when the program week was created.
     - `updated_at`: Timestamp of the last update to the program week's information.
   - **Relationships**:
     - Belongs to: TrainingProgram
     - Has many: WorkoutDay

5. **WorkoutDay**
   - **Attributes**:
     - `id` (Primary Key): Unique identifier for the workout day.
     - `program_week_id` (Foreign Key): References the ProgramWeek entity.
     - `day_number`: Number of the day in the program week.
     - `created_at`: Timestamp of when the workout day was created.
     - `updated_at`: Timestamp of the last update to the workout day's information.
   - **Relationships**:
     - Belongs to: ProgramWeek
     - Has many: Workout

6. **Workout**
   - **Attributes**:
     - `id` (Primary Key): Unique identifier for the workout.
     - `workout_day_id` (Foreign Key): References the WorkoutDay entity.
     - `name`: Name of the workout.
     - `description`: Description of the workout.
     - `created_at`: Timestamp of when the workout was created.
     - `updated_at`: Timestamp of the last update to the workout's information.
   - **Relationships**:
     - Belongs to: WorkoutDay
     - Has many: WorkoutLog

7. **WorkoutLog**
   - **Attributes**:
     - `id` (Primary Key): Unique identifier for the workout log.
     - `workout_id` (Foreign Key): References the Workout entity.
     - `date`: Date on which the workout log was recorded.
     - `duration`: Duration of the workout in minutes.
     - `distance`: Distance covered in the workout (if applicable).
     - `calories_burned`: Calories burned during the workout.
     - `created_at`: Timestamp of when the workout log was recorded.
     - `updated_at`: Timestamp of the last update to the workout log's information.
   - **Relationships**:
     - Belongs to: Workout
