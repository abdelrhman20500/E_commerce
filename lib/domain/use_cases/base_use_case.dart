abstract class BaseUseCase<I,O>{
  O execute(I input);
}