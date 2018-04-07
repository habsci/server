import graphene
from habsci.services.schema import ServiceType
from habsci.services.models import Service as ServiceModel

class CreateService(graphene.Mutation):
    class Arguments:
        name = graphene.String(required=True)
        on_duration = graphene.Int(required=True)
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