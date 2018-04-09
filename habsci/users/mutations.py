import graphene
from habsci.users.schema import UserType
from habsci.users.models import User as UserModel

class CreateUser(graphene.Mutation):
    class Arguments:
        name = graphene.String(required=True)
        avatar_url = graphene.String()
        off_duration = graphene.Int(required=True)

    service = graphene.Field(ServiceType)

    def mutate(self, info, name, on_duration, off_duration):
        service = ServiceModel.objects.create(
          name=name,
          on_duration=on_duration,
          off_duration=off_duration,
        )
        service.save()
        return CreateService(service=service)